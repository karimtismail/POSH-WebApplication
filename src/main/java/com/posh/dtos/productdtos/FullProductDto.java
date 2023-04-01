package com.posh.dtos.productdtos;

import com.google.gson.annotations.Expose;
import com.posh.model.Image;

import java.math.BigDecimal;
import java.util.List;


public class FullProductDto {
    @Expose
    Integer productId;
    @Expose
    int categoryId;
    @Expose
    String name;
    @Expose
    String description;
    @Expose
    String sku;
    @Expose
    BigDecimal price;
    @Expose
    Integer quantity;
    @Expose
    String vendor;
    @Expose
    String brand;
    @Expose
    String madeIn;
    @Expose
    Long pageNumber;
    @Expose
    List<Image> images;

    public FullProductDto() {
    }

    public FullProductDto(Integer productId, int categoryId, String name, String description, String sku, BigDecimal price, Integer quantity, String vendor, String brand, String madeIn, List<Image> images) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.sku = sku;
        this.price = price;
        this.quantity = quantity;
        this.vendor = vendor;
        this.brand = brand;
        this.madeIn = madeIn;
        this.images = images;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Long getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Long pageNumber) {
        this.pageNumber = pageNumber;
    }
}

