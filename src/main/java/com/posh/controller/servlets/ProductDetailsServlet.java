package com.posh.controller.servlets;

import com.posh.dtos.productdtos.FullProductDto;
import com.posh.service.ClientProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(name = "productDetails", value = "/productDetails")
public class ProductDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get FullProduct id From request
        int product_id = Integer.parseInt(req.getParameter("product_id"));
        //Get FullProduct Details
        FullProductDto productByID = ClientProductService.getInstance().findProductByID(product_id);
        //set bean into request
        req.setAttribute("product",productByID);
        //include product details into jsp
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/pages/product-details.jsp");
        requestDispatcher.include(req,resp);
    }
}
///productDetails?product_id=1