package com.posh.dtos.orderdtos;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderDto {

    int orderId;
    BigDecimal totalPrice;
    String orderDate;
    int status;

    public OrderDto() {
    }

    public OrderDto(int orderId, BigDecimal totalPrice, Date orderDate, int status) {
        this.orderId = orderId;
        this.totalPrice = totalPrice;
        this.status = status;
        this.orderDate = getStringDate(orderDate);
    }

    public String getStringDate(Date date){
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = formatter.format(date.getTime());
        return formattedDate;
    }
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
