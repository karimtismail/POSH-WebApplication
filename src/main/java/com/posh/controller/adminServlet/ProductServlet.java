package com.posh.controller.adminServlet;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.posh.dtos.productdtos.FullProductDto;
import com.posh.model.Category;
import com.posh.model.Image;
import com.posh.model.Product;
import com.posh.persistance.repository.implementations.AdminPoductRepository;
import com.posh.utils.enums.CategotyEnum;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "product", value = "/product")
@MultipartConfig
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
            List<FullProductDto> b = AdminPoductRepository.getInstance().getAllProduct(Integer.parseInt(req.getParameter("pageNum")));
            products = gson.toJson(b);
        } else {
            products = gson.toJson(AdminPoductRepository.getInstance().getProductByCategory(category.getId()));
        }
        resp.getWriter().write(products);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Product product = createProduct(req);

        if (product.getProductId() != null ) {
            if (AdminPoductRepository.getInstance().editProduct(product)) {
                resp.getWriter().print("success");
            } else {
                resp.getWriter().print("fail");
            }
        } else {
            Long totalPagesCount = AdminPoductRepository.getInstance().addProduct(product);
            if (totalPagesCount != null)
                resp.getWriter().print(totalPagesCount);
            else {
                resp.getWriter().print("fail");
            }
        }
    }

    private String getImageFromForm(Part filePart) {

        final String path = "D:\\server";
        final String fileName = getFileName(filePart);
        final String fullPath = path + fileName;
        try {
            filePart.write(fullPath);
        } catch (IOException fne) {
            System.out.println(fne);
        }
        String imageName = fullPath.replace("D:\\server","");
        return imageName;
    }

    private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private Product createProduct(HttpServletRequest req) throws ServletException, IOException {
        List<Image> images = new ArrayList<>();
        for (Part part : req.getParts()) {
            String imageName = getImageFromForm(part);
                System.out.println("out "+imageName);
            if(imageName != null && !imageName.equals("null")){
                System.out.println("in");
                Image img = new Image();
                img.setImageName(imageName);
                images.add(img);
            }

        }
        Product product = new Product();
        product.setSku(req.getParameter("sku"));
        product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
        product.setPrice(new BigDecimal(req.getParameter("price")));
        product.setBrand(req.getParameter("brand"));
        product.setMadeIn(req.getParameter("madeIn"));
        product.setVendor(req.getParameter("vendor"));
        product.setDescription(req.getParameter("description"));
        product.setName(req.getParameter("name"));
        product.setImages(images);
        product.setCategory(new Category(CategotyEnum.valueOf(req.getParameter("categoryId")).getId()));
        if (req.getParameter("productId") != null)
            product.setProductId(Integer.parseInt(req.getParameter("productId")));

        return product;
    }
}

