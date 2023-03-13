package com.posh;

import java.io.*;
import java.util.Set;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.posh.model.Category;
import com.posh.repository.UserProductRepository;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
//@WebServlet(name = "helloServlet", value = "/hello-servlet")

public class App {

    public static void main(String[] args) {
        Gson gson = new GsonBuilder()
                .excludeFieldsWithoutExposeAnnotation()
                .create();

        System.out.println(gson.toJson(UserProductRepository.getInstance().getProductByCategory(1)));
        
        System.out.println("main is working");
    }
}