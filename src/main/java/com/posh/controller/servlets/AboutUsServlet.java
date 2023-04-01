package com.posh.controller.servlets;

import com.posh.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AboutUsServlet", value = "/aboutus")
public class AboutUsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/pages/about-us.jsp").forward(request, response);
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("loggedInuser");
        request.setAttribute("user", user);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
