package com.posh.service;

import com.posh.model.*;
import com.posh.utils.ProductValidation;

public class ProductService {
    public boolean validateProduct(Product product) {

        if (ProductValidation.validCategory(product.getCategory().getName())) {
            System.out.println("category");
            if (ProductValidation.validateNotNullBrand(product.getBrand())) {
                System.out.println("brand");
                product.setBrand(product.getBrand().trim());
            } else {
                return false;
            }
            if (ProductValidation.validateNotNullVendor(product.getVendor())) {
            System.out.println("if vendor");
                product.setVendor(product.getVendor().trim());
            } else {
                return false;
            }
            if (ProductValidation.validateNotNullQuantity(product.getQuantity())) {
            System.out.println("if quan");
                product.setQuantity(product.getQuantity());
            } else {
                return false;
            }
            if (ProductValidation.validateNotNullPrice(product.getPrice())) {
            System.out.println("if price");
                product.setPrice(product.getPrice());
            } else {
                return false;
            }
            if (ProductValidation.validateNotNullSku(product.getSku())) {
            System.out.println("if sku");

                product.setSku(product.getSku().trim());
            } else {
                return false;
            }
            if (ProductValidation.validateNotNullMadeIn(product.getMadeIn())) {
            System.out.println("if made in");
                product.setMadeIn(product.getMadeIn().trim());
            } else {
                return false;
            }
            if (ProductValidation.validateNotNullName(product.getName())) {
            System.out.println("if name");
                product.setName(product.getName().trim());
            } else {
                return false;
            }
        } else {
            return false;
        }
        return true;

    }



    public void preprocessingData(Product product) {
        product.setName(product.getName().trim());
        product.setVendor(product.getVendor().trim());
        product.setMadeIn(product.getMadeIn().trim());
        product.setBrand(product.getBrand().trim());
        product.setSku(product.getSku().trim());
        product.setDescription(product.getDescription().trim());
    }

}