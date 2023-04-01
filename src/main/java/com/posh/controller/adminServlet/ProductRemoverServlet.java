package com.posh.controller.adminServlet;

import com.google.gson.Gson;
import com.posh.model.Product;
import com.posh.persistance.repository.implementations.AdminPoductRepository;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

public class ProductRemoverServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = AdminPoductRepository.getInstance()
                        .getProductByPage(Integer.parseInt(request.getParameter("pageNumber")));
       Gson gson = new Gson();
       response.getWriter().println(gson.toJson(product));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isDeleted = AdminPoductRepository.getInstance().removeProduct(Integer.parseInt(request.getParameter("productId")));
        if(isDeleted)
            response.getWriter().print("success");
    }
}
