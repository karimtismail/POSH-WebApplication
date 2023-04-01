package com.posh.controller.servlets;

import com.google.gson.Gson;
import com.posh.dtos.cartdtos.CartProductsResponse;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.UserRepoImpl;
import com.posh.service.CartService;
import com.posh.utils.CookieUtils;
import com.posh.utils.PasswordHasher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final String SUCCESS_USER = "successUser";
    private static final String SUCCESS_ADMIN = "successAdmin";
    private static final String ERROR_STATUS = "error";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("loggedInAdmin") != null) {
            System.out.println("already login as admin");
            request.setAttribute("admin", "adminAttribute");
            // if admin is logged in
            request.getRequestDispatcher("views/pages/admin/home.jsp").forward(request, response);
            return;
        }

        if (session != null && session.getAttribute("loggedInuser") != null) {
            System.out.println("already login");
            // if user is logged in
            User user = (User) session.getAttribute("loggedInuser");
            request.setAttribute("user", user);
            request.getRequestDispatcher("views/pages/profile.jsp").forward(request, response);
            return;
        }

        if (loginWithCookie(request)) {
            System.out.println("login with cookie");
            User user = (User) session.getAttribute("loggedInuser");
            request.setAttribute("user", user);
            request.getRequestDispatcher("views/pages/profile.jsp").forward(request, response);
            return;
        }
        // User is not logged in, redirect to the login page
        request.getRequestDispatcher("views/pages/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String rememberMe = request.getParameter("rememberMeCheckBox");
        Map<String, String> responseMap = new HashMap<>();
        String email = null;
        String password = null;

        if (rememberMe != null && rememberMe.equalsIgnoreCase("checked")) {
            email = request.getParameter("email");
            password = request.getParameter("password");
        } else {
            Optional<User> user = Optional.ofNullable(new Gson().fromJson(request.getReader(), User.class));
            email = user.map(User::getEmail).orElse(null);
            password = user.map(User::getPassword).orElse(null);
        }

        if (email.equals("admin@posh.com")) {
            request.login(email, password);
            boolean isAdmin = request.isUserInRole("admin");
            if (isAdmin) {
                System.out.println("admin bgd");
                System.out.println("role -> " + request.isUserInRole("admin"));
                System.out.println("finally i am admin ISA :)");
                responseMap.put("status", SUCCESS_ADMIN);
                session.setAttribute("loggedInAdmin", "admin");
                if (rememberMe != null && rememberMe.equalsIgnoreCase("checked")) {
                    System.out.println("checked on remember me");
                    String emailPasswordCookieString = email + "+" + password;
                    CookieUtils.getInstance().addCookie(response, "rememberMeCookie", emailPasswordCookieString);
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                }
                response.getWriter().write(new Gson().toJson(responseMap));
            }
        } else {
            if (password == null || !UserRepoImpl.getUserRepo().checkIfEmailExists(email)) {
                responseMap.put("status", ERROR_STATUS);
                response.getWriter().write(new Gson().toJson(responseMap));
                return;
            }

            String passwordUser = UserRepoImpl.getUserRepo().getPasswordHash(email);
            PasswordHasher passwordHasher = PasswordHasher.getInstance(12);
            if (!passwordHasher.verifyHash(password, passwordUser)) {
                responseMap.put("status", ERROR_STATUS);
                response.getWriter().write(new Gson().toJson(responseMap));
                return;
            }
            User realUser = UserRepoImpl.getUserRepo().getUser(email, passwordUser);
            if (realUser == null) {
                responseMap.put("status", ERROR_STATUS);
                response.getWriter().write(new Gson().toJson(responseMap));
                return;
            }
            responseMap.put("status", SUCCESS_USER);
            if (rememberMe != null && rememberMe.equalsIgnoreCase("checked")) {
                System.out.println("checked on remember me");
                String emailPasswordCookieString = realUser.getEmail() + "+" + realUser.getPassword();
                CookieUtils.getInstance().addCookie(response, "rememberMeCookie", emailPasswordCookieString);
                response.sendRedirect(request.getContextPath() + "/home");
            }
            session.setAttribute("loggedInuser", realUser);
            CartService cartDao = CartService.getInstance();
            CartProductsResponse data = cartDao.getCartProducts(realUser);
            session.setAttribute("cartResponse", data);
            response.getWriter().write(new Gson().toJson(responseMap));
        }
    }

    private boolean loginWithCookie(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Optional<Cookie> optionalCookie = CookieUtils.getInstance().getCookie(request.getCookies(), "rememberMeCookie");
        boolean result = false;
        if (optionalCookie.isPresent()) {
            String cookieValue = optionalCookie.get().getValue();
            String userEmailFromCookie = cookieValue.substring(0, cookieValue.indexOf("+"));
            String userPasswordFromCookie = cookieValue.substring(cookieValue.indexOf("+") + 1);
            if (session != null && session.getAttribute("loggedInAdmin") != null) {
                result = true;
            } else if (session != null && session.getAttribute("loggedInuser") != null) {
                Optional<User> optionalUser = Optional.ofNullable(UserRepoImpl.getUserRepo().getUser(userEmailFromCookie, userPasswordFromCookie));
                if (optionalUser.isPresent()) {
                    request.getSession().setAttribute("user", optionalUser.get());
                    result = true;
                }
            }
        }
        return result;
    }
}
