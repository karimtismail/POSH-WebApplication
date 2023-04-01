package com.posh;

import com.google.gson.Gson;
import com.posh.persistance.repository.implementations.OrderDao;
import com.posh.service.CartService;
import com.posh.utils.enums.CategotyEnum;
import jakarta.xml.bind.JAXBException;

import java.io.IOException;
//@WebServlet(name = "helloServlet", value = "/hello-servlet")

public class App {

    public static void main(String[] args) throws JAXBException, IOException {
        System.out.println(CategotyEnum.valueOf("OIL").getName());
        System.out.println(CategotyEnum.valueOf("OIL").getId());

    }


}