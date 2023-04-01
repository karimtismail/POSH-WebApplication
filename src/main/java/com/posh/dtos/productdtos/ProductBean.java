package com.posh.dtos.productdtos;

import java.util.List;

public class ProductBean {

    List<HomeProduct> products;

    public ProductBean() {
    }

    public ProductBean(List<HomeProduct> products) {
        this.products = products;
    }

    public List<HomeProduct> getProducts() {
        return products;
    }

    public void setProducts(List<HomeProduct> products) {
        this.products = products;
    }
}
