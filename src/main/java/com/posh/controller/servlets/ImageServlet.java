package com.posh.controller.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
@WebServlet(name = "resource", value = "/resource")
public class ImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(req.getParameter("image"));
        response.setContentType("image");
        String imageName = req.getParameter("image").replace(" ","");
        System.out.println(imageName);
        String fileDirectory = "D:\\server\\";
        response.setHeader("Content-Disposition", "attachment; filename=\"image\"");
        File file = new File(fileDirectory + imageName);
        try (FileInputStream fileOutputStream = new FileInputStream(file)) {
            byte[] imageBytes = new byte[(int) file.length()];
            fileOutputStream.read(imageBytes);
            response.getOutputStream().write(imageBytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
