package com.posh.utils;

import com.posh.dtos.orderdtos.CartOrderRequest;
import com.posh.dtos.orderdtos.SingleOrderRequest;
import com.posh.model.User;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;

public class OrderRecordGenerator {

    public static SingleOrderRequest generateOrderRequestRecord(HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        boolean isSameAddress = Boolean.parseBoolean(request.getParameter("billingAddress"));
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        System.out.println(new String(request.getInputStream().readAllBytes(), "utf-8"));

        System.out.println(
                "id : " + request.getParameter("id")
                        + "\nprice : " +request.getParameter("price")
                        + "\nquantity: " + request.getParameter("quantity")
                        + "\ncity: " + city
                        + "\naddress : " + address
                        + "\nnote: " + request.getParameter("note")
                        + "\nimage : " + request.getParameter("image")
                        + "\nname : " + request.getParameter("name")
        );

        if (!isSameAddress) {
            User user = (User) request.getSession(false).getAttribute("loggedInuser");
            address = user.getAddress();
            city = user.getCity();
        }


        return new SingleOrderRequest(
                Integer.parseInt(request.getParameter("id")),
                new BigDecimal(request.getParameter("price")),
                Integer.parseInt(request.getParameter("quantity")),
                city,
                address,
                request.getParameter("note"),
                request.getParameter("image"),
                request.getParameter("name")
        );
    }

    public static CartOrderRequest generateCartOrderRequestRecord(HttpServletRequest request) {
        boolean isSameAddress = Boolean.parseBoolean(request.getParameter("billingAddress"));
        String address = request.getParameter("address");
        String city = request.getParameter("v");

        if (!isSameAddress) {
            User user = (User) request.getSession(false).getAttribute("loggedInuser");
            address = user.getAddress();
            city = user.getCity();
        }

        return new CartOrderRequest(
                address,
                city,
                request.getParameter("note")
        );
    }


}
