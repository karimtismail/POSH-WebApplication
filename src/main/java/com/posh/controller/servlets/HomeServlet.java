package com.posh.controller.servlets;

import com.posh.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Form home");
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedInuser") != null) {
            // if user is logged in
            User user = (User) session.getAttribute("loggedInuser");
            request.setAttribute("user", user);
            request.getRequestDispatcher("views/pages/index.jsp").forward(request, response);
        } else {
            // User is not logged in, redirect to the login page
            request.getRequestDispatcher("views/pages/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
