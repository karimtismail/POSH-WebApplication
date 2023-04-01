package com.posh.utils.Mapper.converterimpl;

import com.posh.dtos.orderdtos.OrderDto;
import com.posh.model.Order;

import java.util.function.Function;

public class OrderToOrderDto implements Function<Order, OrderDto> {
    @Override
    public OrderDto apply(Order order) {
        return new OrderDto(
                order.getOrderId(),
                order.getTotalPrice(),
                order.getOrderDate(),
                order.getStatus()
        );
    }
}