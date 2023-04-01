package com.posh;

import com.posh.dtos.orderdtos.CartOrderRequest;
import com.posh.dtos.orderdtos.OrderDto;
import com.posh.dtos.orderdtos.OrdersBean;
import com.posh.model.Order;
import com.posh.model.User;
import com.posh.persistance.Database;
import com.posh.persistance.repository.implementations.OrderDao;
import com.posh.service.CartService;
import com.posh.service.OrderService;
import com.posh.utils.enums.OrderStatus;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class OrderTest {

    @Test
    public void Make_Cart_order() {
        //Arrange
        User user = Database.doInTransaction(em -> em.find(User.class, 3));
        CartService cartService = CartService.getInstance();
        //Act
        OrderDao orderDao = new OrderDao();
        orderDao.OrderCart(user, new CartOrderRequest("gagag", "cairo", "please gfaonsfonsf"));
        //Assert
        int cartSize = cartService.getCartProducts(user).getProductDtos().size();
        Assertions.assertEquals(cartSize, 0);
    }

    @Test
    public void map() {
        //Arrange
        Order order = Database.doInTransaction(em -> em.find(Order.class, 1));
        //Act
        //assert
    }

    @Test
    public void getOrders() {
        //Arrange
        int user_id = 3;
        //Act
        System.out.println("Size : " + new OrderDao().getOrders(user_id).size());

        OrdersBean ordersBean = new OrderService().getOrders(user_id);
        //Assert
        System.out.println(ordersBean.getOrders().size());
    }

    @Test
    public void CancelOrder() {
        //Arrange
        OrderService orderService = new OrderService();
        User user = Database.doInTransaction(em -> em.find(User.class, 3));
        //ACT
        int order_id = user.getOrderses().get(0).getOrderId();
        orderService.UpdateOrderStatus(order_id, OrderStatus.CANCEL);
        //Assert
        User user1 = Database.doInTransaction(em -> em.find(User.class, 3));
        Assertions.assertTrue(order_id != user1.getOrderses().get(0).getOrderId());
    }

    @Test
    public void change_Order_status() {
        //Arrange
        //Arrange
        OrderService orderService = new OrderService();
        User user = Database.doInTransaction(em -> em.find(User.class, 3));
        //ACT
        int order_id = user.getOrderses().get(0).getOrderId();
        orderService.UpdateOrderStatus(order_id, OrderStatus.COMPLETE);
        //Assert
        User user1 = Database.doInTransaction(em -> em.find(User.class, 3));
        Assertions.assertEquals(OrderStatus.COMPLETE.orderStatus, user1.getOrderses().get(0).getStatus());
    }
}
