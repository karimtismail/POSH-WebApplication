package com.posh.controller.servlets;

import com.google.gson.Gson;
import com.posh.dtos.cartdtos.CartProductDto;
import com.posh.dtos.cartdtos.CartProductsResponse;
import com.posh.dtos.orderdtos.CheckoutResponse;
import com.posh.dtos.orderdtos.OrderResponse;
import com.posh.dtos.orderdtos.OrderStatusChangeResponse;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.OrderDao;

import com.posh.service.OrderService;
import com.posh.utils.OrderRecordGenerator;
import com.posh.utils.enums.OrderStatus;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "order", loadOnStartup = 1,
        urlPatterns = {
                "/checkoutSingleProduct",
                "/checkoutCartProducts",
                "/orders",
                "/UpdateOrder"})
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        OrderResponse orderResponse = new OrderResponse();
        if (path.equals("/checkoutSingleProduct")) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String price = req.getParameter("price");
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            String image = req.getParameter("image");

            CartProductDto product = new CartProductDto(id, name, new BigDecimal(price), quantity, image);
            orderResponse.setOperation(0);
            List<CartProductDto> cartProductDtos = new ArrayList<>();
            cartProductDtos.add(product);
            System.out.println(product.getId() + " " + product.getPrice() + " " + product.getImage() + "size = " + cartProductDtos.size());
            orderResponse.setProducts(cartProductDtos);
        } else if (path.equals("/orders")) {
            User user = (User) req.getSession().getAttribute("loggedInuser");
            OrderService orderService = new OrderService();
            req.setAttribute("orderBean", orderService.getOrders(user.getId()));
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/pages/order.jsp");
            requestDispatcher.include(req, resp);
            return;
        } else {
            CartProductsResponse cartProducts = (CartProductsResponse) req.getSession(false).getAttribute("cartResponse");
            orderResponse.setOperation(1);
            orderResponse.setProducts(cartProducts.getProductDtos());
        }
        req.setAttribute("checkoutResponse", orderResponse);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/pages/checkout.jsp");
        requestDispatcher.include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String path = req.getServletPath();
        User user = (User) req.getSession().getAttribute("loggedInuser");
        OrderService order = new OrderService();
        CheckoutResponse checkoutResponse = null;
        if (path.equals("/checkoutSingleProduct")) {
            System.out.println("post value");
            checkoutResponse = order.orderSingleProduct(user, OrderRecordGenerator.generateOrderRequestRecord(req));
        } else if (path.equals("/UpdateOrder")) {
            resp.setContentType("");
            OrderStatus orderStatus = OrderStatus.getOrderStatus(Integer.parseInt(req.getParameter("orderStatus")));
            int order_id = Integer.parseInt(req.getParameter("order_id"));
            boolean isUpdated = order.UpdateOrderStatus(order_id, orderStatus);

            int code = (isUpdated)? 200: 500;
            String message = (code == 200)? "successfully Updated" : "Fail to Update";
            resp.getWriter().write(new Gson().toJson(new OrderStatusChangeResponse(code, message)));
            return;
        } else {
            checkoutResponse = order.OrderCart(user, OrderRecordGenerator.generateCartOrderRequestRecord(req));
        }

        req.setAttribute("sCheckoutResponse", checkoutResponse);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("successfullcheckout");
        requestDispatcher.include(req, resp);
    }

}
