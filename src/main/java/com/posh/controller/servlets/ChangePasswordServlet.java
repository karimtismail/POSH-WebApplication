package com.posh.controller.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.UserRepoImpl;
import com.posh.utils.PasswordHasher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ChangePassword", value = "/change-password")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do get forgot password servlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> result = new HashMap<>();
        String body = new String(request.getInputStream().readAllBytes());
        JsonReader reader = new JsonReader(new StringReader(body));
        reader.setLenient(true);
        JsonObject jsonObject = JsonParser.parseReader(reader).getAsJsonObject();

        User userSession = (User) request.getSession().getAttribute("loggedInuser");

        String currentPassword = jsonObject.get("currentPassword").getAsString();
        String newPassword = jsonObject.get("newPassword").getAsString();
        String confirmPassword = jsonObject.get("confirmPassword").getAsString();

        // Validate input with current password
        if (!PasswordHasher.getInstance(12).verifyHash(currentPassword, userSession.getPassword())) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            result.put("status", "errorVerifyPassword");
            response.getWriter().write(new Gson().toJson(result));
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            result.put("status", "error");
            response.getWriter().write(new Gson().toJson(result));
            return;
        }

        userSession.setPassword(PasswordHasher.getInstance(12).hash(newPassword));
        if (UserRepoImpl.getUserRepo().updatePasswordUser(userSession)) {
            result.put("status", "success");
            response.getWriter().write(new Gson().toJson(result));
        } else {
            result.put("status", "error");
            response.getWriter().write(new Gson().toJson(result));
        }
    }
}
