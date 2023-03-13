package com.posh.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.posh.model.Product;
import com.posh.repository.UserProductRepository;
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
        Gson gson = new GsonBuilder()
                .excludeFieldsWithoutExposeAnnotation()
                .create();
        CategotyEnum category = CategotyEnum.valueOf(req.getParameter("category"));
        String products = null;
        if (category == CategotyEnum.ALL) {
            products = gson.toJson(UserProductRepository.getInstance().getAllProduct());
        } else {
            products = gson.toJson(UserProductRepository.getInstance().getProductByCategory(category.getId()));
        }
        System.out.println(products);
        resp.getWriter().write(products);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO : update or create new product with post request
    }
}
