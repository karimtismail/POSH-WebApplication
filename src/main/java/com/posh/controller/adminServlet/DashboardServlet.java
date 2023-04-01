package com.posh.controller.adminServlet;

import com.posh.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedInAdmin") != null) {
            // if user is logged in
            request.getRequestDispatcher("views/pages/admin/home.jsp").forward(request, response);
        } else {
            // User is not logged in, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
