package com.posh.controller.adminServlet;

import com.google.gson.Gson;
import com.posh.dtos.UserOrdersDto;
import com.posh.persistance.repository.implementations.AdminPoductRepository;
import com.posh.persistance.repository.implementations.AdminRepository;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

public class FetchingUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String users = gson.toJson(AdminRepository.getInstance().getUsers());
        response.getWriter().write(users);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String orders = gson.toJson(AdminRepository.getInstance()
                .getOrdersPerUser(Integer.parseInt(request.getParameter("userId"))));

        response.getWriter().print(orders);

    }
}
