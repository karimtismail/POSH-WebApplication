package com.posh.dtos.cartdtos;

import java.util.List;

public class CartProductsResponse {

    int cart_id;
    private int totalAmount;
    private int shippingPrice;
    private List<CartProductDto> productDtos;
    public CartProductsResponse() {
    }

    public CartProductsResponse(int cart_id,List<CartProductDto> productDtos) {
        this.cart_id = cart_id;
        this.productDtos = productDtos;
        totalAmount = calculateTotalAmount();
        shippingPrice = productDtos.size() * 70;
    }

    public int calculateTotalAmount() {
        return productDtos.stream()
                .map(cartProductDto -> cartProductDto.getPrice().intValue() * cartProductDto.getQuantity())
                .reduce(0,Integer::sum);
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getShippingPrice() {
        return shippingPrice;
    }

    public void setShippingPrice(int shippingPrice) {
        this.shippingPrice = shippingPrice;
    }

    public List<CartProductDto> getProductDtos() {
        return productDtos;
    }

    public void setProductDtos(List<CartProductDto> productDtos) {
        this.productDtos = productDtos;
        totalAmount = calculateTotalAmount();
        shippingPrice = productDtos.size() * 70;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }
}
