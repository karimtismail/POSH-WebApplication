package com.posh.controller;

import com.google.gson.Gson;
import com.posh.model.ProductsEntity;
import com.posh.repository.ProductRepository;
import com.posh.utils.enums.CategotyEnum;
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
            products = gson.toJson(new ProductRepository().getProducts());
        } else {
            products = gson.toJson(new ProductRepository().getProductsByCategory(category));
        }
        System.out.println(products);
        resp.getWriter().write(products);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        String productJson = req.getParameter("product");
        ProductsEntity product = gson.fromJson(productJson, ProductsEntity.class);
        System.out.println(product.getProductId());
        new ProductRepository().addProduct(product);
    }
}
