package com.posh.dtos.orderdtos;

import java.util.List;

public class OrdersBean {
    private List<OrderDto> orders;

    public OrdersBean(List<OrderDto> orders) {
        this.orders = orders;
    }

    public OrdersBean() {
    }

    public List<OrderDto> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderDto> orders) {
        this.orders = orders;
    }
}
