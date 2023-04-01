package com.posh.service;


import com.posh.dtos.orderdtos.*;
import com.posh.model.Order;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.OrderDao;
import com.posh.utils.Mapper.Mapper;
import com.posh.utils.enums.OrderStatus;

import java.util.List;

public class OrderService {
    private OrderDao orderDao;

    public OrderService() {
        orderDao = new OrderDao();
    }

    private boolean cancelOrder(int order_id) {
        return orderDao.cancelOrder(order_id);
    }

    public boolean UpdateOrderStatus(int order_id, OrderStatus orderStatus) {
        if (orderStatus == OrderStatus.CANCEL) {
            //cancel order by remove order
            return cancelOrder(order_id);
        } else {
            //Update Order
            return orderDao.updateOrderStatus(order_id, orderStatus);
        }
    }

    public OrdersBean getOrders(int user_id) {
        List<Order> orders = orderDao.getOrders(user_id);
        //Transfer order to orderDto
        List<OrderDto> orderDtos = Mapper.listMapping(orders, OrderDto.class);
        return new OrdersBean(orderDtos);
    }

    public CheckoutResponse orderSingleProduct(User user, SingleOrderRequest singleOrderRequest) {
        return orderDao.orderSingleProduct(user, singleOrderRequest);
    }

    public CheckoutResponse OrderCart(User user, CartOrderRequest cartOrderRequest) {
        return orderDao.OrderCart(user, cartOrderRequest);
    }
}
