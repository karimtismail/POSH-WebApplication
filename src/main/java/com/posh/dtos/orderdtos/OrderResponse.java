package com.posh.dtos.orderdtos;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.posh.dtos.cartdtos.CartProductDto;

public class OrderResponse {
    int operation;
    BigDecimal totalPrice;
    List<CartProductDto> products = new ArrayList<>(0);

    public OrderResponse() {
    }

    public OrderResponse(int operation, List<CartProductDto> products) {
        this.operation = operation;
        this.products = products;
    }

    public int getOperation() {
        return operation;
    }

    public void setOperation(int operation) {
        this.operation = operation;
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

    private void calculatePrice() {
        this.totalPrice =  products.stream()
                .map(cartProductDto -> cartProductDto.getPrice().multiply(BigDecimal.valueOf(cartProductDto.getQuantity())) )
                .reduce(BigDecimal::add).get();
    }
}
