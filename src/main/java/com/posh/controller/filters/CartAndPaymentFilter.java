package com.posh.controller.filters;

import com.posh.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "CartAndPaymentFilter", urlPatterns = {
        "/addToCart",
        "/viewCart",
        "/updateCart",
        "/removeCart",
        "/checkoutSingleProduct",
        "/checkoutCartProducts",
        "/orders"})
public class CartAndPaymentFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("cart filter");
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        User user = (User) httpServletRequest.getSession(false).getAttribute("loggedInuser");
        if (user == null) {
            //Return back to login
            httpServletResponse.sendRedirect("login");
            System.out.println("return to login page");
        } else{
            chain.doFilter(request, response);
        }

    }
}
