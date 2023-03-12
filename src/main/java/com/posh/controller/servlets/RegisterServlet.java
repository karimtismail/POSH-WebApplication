package com.posh.controller.servlets;

import com.posh.model.UsersEntity;
import com.posh.repository.implementations.UserRepoImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("i inside do get in servlet");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("i inside do get registration controller");
        request.getRequestDispatcher("views/pages/register.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("i inside do post registration controller");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String body = new String(request.getInputStream().readAllBytes());
        System.out.println("body -> " + body);

        String firstName = (String) request.getAttribute("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String dateString = request.getParameter("dob");
        Date dob = null;
        if (dateString != null && !dateString.isEmpty()) {
            System.out.println("Date string is not empty: " + dateString);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                dob = format.parse(dateString);
                System.out.println("Parsed date: " + dob.toString());
            } catch (ParseException e) {
                System.out.println("Error parsing date string: " + dateString);
                throw new RuntimeException(e);
            }
        } else {
            System.out.println("Date is null");
        }
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phoneNumber = request.getParameter("phoneNumber");
        String genderSelected = request.getParameter("genderSelected");
        String address = request.getParameter("address");
        String citySelected = request.getParameter("citySelected");
        System.out.println("name: " + firstName);

        System.out.println("Entered email: " + email);
// firstName != null && lastName != null && email != null && password != null && confirmPassword != null && phoneNumber != null
        if (UserRepoImpl.getUserRepo().checkIfEmailExists(email)) {
            System.out.println("failed create user - already exist");
        } else {
            UsersEntity user = new UsersEntity();
            System.out.println(firstName + " - " + lastName + " - " + email + " - " + genderSelected + " - " + address + " - " + citySelected);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setDateOfBirth(dob);
            user.setPassword(password);
            user.setPhoneNum(phoneNumber);
            user.setGender(genderSelected);
            user.setAddress(address);
            user.setCity(citySelected);
            UserRepoImpl.getUserRepo().createUser(user);
            System.out.println("success create user");
        }
//        request.getRequestDispatcher("views/pages/login.jsp").forward(request, response);
        response.sendRedirect("views/pages/login.jsp");

    }
}
