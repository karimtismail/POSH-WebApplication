package com.posh.controller.servlets;

import com.google.gson.Gson;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.UserRepoImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.posh.utils.PasswordHasher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistrationServlet", value = "/submitregister")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String body = new String(request.getInputStream().readAllBytes());
        Gson gson = new Gson();
        User user = gson.fromJson(body, User.class);

        Map<String, String> result = new HashMap<>();
        if (UserRepoImpl.getUserRepo().checkIfEmailExists(user.getEmail())) {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            System.out.println("failed create user - already exist");
            result.put("status", "error");
            result.put("message", "User with this email already exists");
        } else {
            user.setUsername(user.getUsername());
            user.setEmail(user.getEmail());
            user.setDateOfBirth(user.getDateOfBirth());
            user.setPassword(PasswordHasher.getInstance(12).hash(user.getPassword()));
            user.setPhoneNum(user.getPhoneNum());
            user.setGender(user.getGender());
            user.setAddress(user.getAddress());
            user.setCity(user.getCity());
            user.setCreditLimit(user.getCreditLimit());
            boolean statusCreateUser = UserRepoImpl.getUserRepo().createUser(user);
            if (statusCreateUser) {
                response.setStatus(HttpServletResponse.SC_CREATED);
                System.out.println("success create user");
                result.put("status", "success");
                result.put("message", "User created successfully");
            } else {
                System.out.println("failed create user");
                result.put("status", "error");
                result.put("message", "Failed to create user");
            }
        }
        String json = new Gson().toJson(result);
        response.getWriter().write(json);
    }
}
