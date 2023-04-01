package com.posh.dtos.orderdtos;

import com.posh.dtos.cartdtos.CartProductDto;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CheckoutResponse {
    int orderId;
    BigDecimal totalPrice;
    List<CartProductDto> products = new ArrayList<>(0);

    String address;
    String city;

    public CheckoutResponse() {
    }

    public CheckoutResponse(int orderId, List<CartProductDto> products, String address, String city) {
        this.products = products;
        this.address = address;
        this.city = city;
        this.orderId = orderId;
        calculatePrice();
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<CartProductDto> getProducts() {
        return products;
    }

    public void setProducts(List<CartProductDto> products) {
        this.products = products;
        calculatePrice();
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    private void calculatePrice() {
        this.totalPrice =  products.stream()
                .map(cartProductDto -> cartProductDto.getPrice().multiply(BigDecimal.valueOf(cartProductDto.getQuantity())) )
                .reduce(BigDecimal::add).get();
    }
}
