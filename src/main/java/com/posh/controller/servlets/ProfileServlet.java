package com.posh.controller.servlets;

import com.google.gson.Gson;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.UserRepoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedInuser") != null) {
            // if user is logged in
            User user = (User) session.getAttribute("loggedInuser");
            request.setAttribute("user", user);
            request.getRequestDispatcher("views/pages/profile.jsp").forward(request, response);
        } else {
            // User is not logged in, redirect to the login page
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        User userSession = (User) request.getSession().getAttribute("loggedInuser");
        System.out.println("in do post profile");
        String body = new String(request.getInputStream().readAllBytes());
        System.out.println(body);
        Gson gson = new Gson();
        User user = gson.fromJson(body, User.class);

        Map<String, String> result = new HashMap<>();

        user.setUsername(user.getUsername());
        user.setEmail(userSession.getEmail());
        user.setDateOfBirth(userSession.getDateOfBirth());
        user.setPassword(userSession.getPassword());
        user.setPhoneNum(user.getPhoneNum());
        user.setGender(userSession.getGender());
        user.setAddress(user.getAddress());
        user.setCity(userSession.getCity());
        user.setCreditLimit(user.getCreditLimit());

        request.getSession().setAttribute("loggedInuser", user);

        if (UserRepoImpl.getUserRepo().updateUser(user)) {
            System.out.println("Updated User");
            result.put("status", "success");
        } else {
            System.out.println("Failed Updated User");
            result.put("status", "error");
        }

        String json = new Gson().toJson(result);
        response.getWriter().write(json);
    }
}
