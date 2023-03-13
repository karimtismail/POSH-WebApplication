package com.posh.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class ImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg");
        String imageName = req.getParameter("image");
        String fileDirectory = "C:\\Users\\Gmoaa\\Desktop\\server\\";
        response.setHeader("Content-Disposition", "attachment; filename=\"image.jpg\"");
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
