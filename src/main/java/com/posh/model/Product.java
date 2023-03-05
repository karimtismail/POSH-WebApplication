package com.posh.model;

public class Product {
    private int product_id;
    private String product_name;
    private String expire_Date;
    private int category_id;
    private String product_Description;
    private int product_count;
    private int price;
    private String product_skun;
    private String product_vendor;
    private String product_Brand;
    private String product_industry;
    private String product_image;

    public Product(int product_id, String product_name, String expire_Date, int category_id, String product_Description, int product_count, int price, String product_skun, String product_vendor, String product_Brand, String product_industry, String product_image) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.expire_Date = expire_Date;
        this.category_id = category_id;
        this.product_Description = product_Description;
        this.product_count = product_count;
        this.price = price;
        this.product_skun = product_skun;
        this.product_vendor = product_vendor;
        this.product_Brand = product_Brand;
        this.product_industry = product_industry;
        this.product_image = product_image;

    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getExpire_Date() {
        return expire_Date;
    }

    public void setExpire_Date(String expire_Date) {
        this.expire_Date = expire_Date;
    }

    public String getProduct_Description() {
        return product_Description;
    }

    public void setProduct_Description(String product_Description) {
        this.product_Description = product_Description;
    }

    public int getProduct_count() {
        return product_count;
    }

    public void setProduct_count(int product_count) {
        this.product_count = product_count;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProduct_skun() {
        return product_skun;
    }

    public void setProduct_skun(String product_skun) {
        this.product_skun = product_skun;
    }

    public String getProduct_vendor() {
        return product_vendor;
    }

    public void setProduct_vendor(String product_vendor) {
        this.product_vendor = product_vendor;
    }

    public String getProduct_Brand() {
        return product_Brand;
    }

    public void setProduct_Brand(String product_Brand) {
        this.product_Brand = product_Brand;
    }

    public String getProduct_industry() {
        return product_industry;
    }

    public void setProduct_industry(String product_industry) {
        this.product_industry = product_industry;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }
}
