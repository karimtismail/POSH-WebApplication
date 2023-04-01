package com.posh.controller.servlets;

import com.posh.dtos.productdtos.HomeProduct;
import com.posh.dtos.productdtos.ProductBean;
import com.posh.model.User;
import com.posh.service.ClientProductService;
import com.posh.utils.enums.CategotyEnum;

import com.posh.dtos.FilterRecord;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "clientproduct",
        urlPatterns = {
                "/productList",
                "/popular"})
public class ClientProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String urlPattern = req.getServletPath();
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("loggedInuser");
        req.setAttribute("user", user);

        List<HomeProduct> products = null;
        String jspFile = null;
        if (urlPattern.equals("/productList")) {
            FilterRecord filterRecord = extractRequestFilterData(req);
            products = ClientProductService.getInstance().FilterProduct(filterRecord);
            jspFile = "views/pages/productItem.jsp";
            System.out.println("product list");
        } else {
            products = ClientProductService.getInstance().findPopularProducts();
            jspFile = "views/pages/popularProduct.jsp";
            System.out.println("popular list");
        }

        req.setAttribute("ProductBean", new ProductBean(products));
        System.out.println(products);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher(jspFile);
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO : update or create new product with post request
    }

    private FilterRecord extractRequestFilterData(HttpServletRequest req) {
        return new FilterRecord(
                new int[]{CategotyEnum.valueOf(req.getParameter("category")).getId()},
                new BigDecimal(req.getParameter("startPrice")),
                new BigDecimal(req.getParameter("endPrice")),
                Integer.parseInt(req.getParameter("page")),
                ""
        );
    }
}
