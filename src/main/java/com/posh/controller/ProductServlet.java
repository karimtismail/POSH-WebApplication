package com.posh.controller;

import com.google.gson.Gson;
import com.posh.repository.FakeProductRepository;
import com.posh.utils.CategotyEnum;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        Gson gson = new Gson();
        CategotyEnum category = CategotyEnum.valueOf(req.getParameter("category"));
        String products = null;
        if (category == CategotyEnum.ALL) {
            products = gson.toJson(new FakeProductRepository().getProducts());
        } else {
            products = gson.toJson(new FakeProductRepository().getProductsByCategory(category));
        }
        System.out.println(products);
        resp.getWriter().write(products);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //TODO : update or create new product with post request
    }
}
