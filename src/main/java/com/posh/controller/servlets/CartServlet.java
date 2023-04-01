package com.posh.controller.servlets;

import com.posh.dtos.cartdtos.CartProductsResponse;
import com.posh.model.User;
import com.posh.service.CartService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "cart", loadOnStartup = 1,
        urlPatterns = {
                "/addToCart",
                "/viewCart",
                "/updateCart",
                "/removeCart"})
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userPath = req.getServletPath();
        if (userPath.equals("/viewCart")) {
            User user = (User) req.getSession().getAttribute("loggedInuser");
            CartService cartDao = CartService.getInstance();
            CartProductsResponse data = cartDao.getCartProducts(user);
            req.getSession(false).setAttribute("cartResponse", data);

            CartProductsResponse cartProductsResponse = (CartProductsResponse) req.getSession(false).getAttribute("cartResponse");
            System.out.println("cart Response : " + cartProductsResponse.getProductDtos().size());

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/pages/Cart.jsp");
            requestDispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userPath = req.getServletPath();
        resp.setContentType("application/json");

        int product_id = Integer.parseInt(req.getParameter("product_id"));
        User user = (User) req.getSession().getAttribute("loggedInuser");

        CartService cartDao = CartService.getInstance();
        String response = null;

        if (userPath.equals("/addToCart")) {
            //Implement add product to cart
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            response = generateResponse( cartDao.addProductToCart(product_id, user, quantity) );
        } else if (userPath.equals("/updateCart")) {
            //Implement update product in cart
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            response = generateResponse(String.valueOf(cartDao.updateCartProduct(product_id, user, quantity)));
        } else if (userPath.equals("/removeCart")) {
            //Implement remove product from cart
            response = generateResponse(String.valueOf(cartDao.removeProductFromCart(product_id, user)));
        }



        System.out.println(response);
        resp.getWriter().write(response);
    }

    private String generateResponse(String result){
        return "{ \"result\":\"" + result + "\"}" ;
    }
}
