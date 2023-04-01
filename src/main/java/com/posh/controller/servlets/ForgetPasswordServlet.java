package com.posh.controller.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.UserRepoImpl;
import com.posh.utils.EmailUtility;
import com.posh.utils.PasswordHasher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;

import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ForgetPassword", value = "/forget-password")
public class ForgetPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("do get forgot password servlet");
        request.getRequestDispatcher("views/pages/forgot-password.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> result = new HashMap<>();
        String body = new String(request.getInputStream().readAllBytes());
        JsonReader reader = new JsonReader(new StringReader(body));
        reader.setLenient(true);
        JsonObject jsonObject = JsonParser.parseReader(reader).getAsJsonObject();
        String email = jsonObject.get("email").getAsString();
        String newPassword = generateRandomPassword();

        String emailBody = "Hi, this is your new password: " +
                newPassword +
                "\nNote: for security reason, you must change your password after logging in.\n" +
                "Click here to login http://localhost:9191/posh/login";

        try {
            User user = UserRepoImpl.getUserRepo().getUser(email);
            if (user == null) {
                result.put("status", "error");
                return;
            }
            System.out.println("in check email - user name -> " + user.getUsername());
            boolean check = EmailUtility.sendEmail(emailBody);
            System.out.println("check boolean -> " + check);
            if (check) {
                user.setPassword(PasswordHasher.getInstance(12).hash(newPassword));
                if (!UserRepoImpl.getUserRepo().updatePasswordUser(user)) {
                    result.put("status", "error");
                    return;
                }
                result.put("status", "success");
            } else {
                result.put("status", "error");
                result.put("message", "Failed to send email");
                response.sendRedirect(request.getContextPath() + "/forget-password");
            }
        } catch (Exception ex) {
            result.put("status", "error");
            ex.printStackTrace();
            result.put("message", "Exception occurred: " + ex.getMessage());
        }
        String json = new Gson().toJson(result);
        response.getWriter().write(json);
    }

    private String generateRandomPassword() {
        return RandomStringUtils.randomAlphanumeric(10, 15);
    }
}
