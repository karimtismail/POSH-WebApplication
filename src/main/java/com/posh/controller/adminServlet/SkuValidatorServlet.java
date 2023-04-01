package com.posh.controller.adminServlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

import com.posh.persistance.repository.implementations.AdminPoductRepository;

public class SkuValidatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean result = AdminPoductRepository.getInstance().validateSku(request.getParameter("sku"));
        if(result)
            response.getWriter().println("Exists");
        else
            response.getWriter().println("Not");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
