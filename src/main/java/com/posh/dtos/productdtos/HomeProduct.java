package com.posh.dtos.productdtos;

import java.math.BigDecimal;

public class HomeProduct {
        Integer productId;
        String name;
        BigDecimal price;
        String sku;
        String vendor;
        String image;
        int category;

        public HomeProduct() {
        }

        public HomeProduct(Integer productId, String name, BigDecimal price, String sku, String vendor, String image,
                           int category) {
                this.productId = productId;
                this.name = name;
                this.price = price;
                this.sku = sku;
                this.vendor = vendor;
                this.image = image;
                this.category = category;
        }

        public Integer getProductId() {
                return productId;
        }

        public void setProductId(Integer productId) {
                this.productId = productId;
        }

        public String getName() {
                return name;
        }

        public void setName(String name) {
                this.name = name;
        }

        public BigDecimal getPrice() {
                return price;
        }

        public void setPrice(BigDecimal price) {
                this.price = price;
        }

        public String getSku() {
                return sku;
        }

        public void setSku(String sku) {
                this.sku = sku;
        }

        public String getVendor() {
                return vendor;
        }

        public void setVendor(String vendor) {
                this.vendor = vendor;
        }

        public String getImage() {
                return image;
        }

        public void setImage(String image) {
                this.image = image;
        }

        public int getCategory() {
                return category;
        }

        public void setCategory(int category) {
                this.category = category;
        }

}
