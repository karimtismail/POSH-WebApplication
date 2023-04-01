package com.posh.persistance.repository.implementations;

import com.posh.dtos.cartdtos.CartProductDto;
import com.posh.dtos.orderdtos.CartOrderRequest;
import com.posh.dtos.orderdtos.CheckoutResponse;
import com.posh.dtos.orderdtos.SingleOrderRequest;
import com.posh.model.*;
import com.posh.persistance.Database;
import com.posh.service.CartService;
import com.posh.utils.enums.OrderStatus;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public Order findOrder(int order_id) {
        return Database.doInTransaction(entityManager -> entityManager.find(Order.class, order_id));
    }

    public List<Order> findUserOrders(int user_id) {
        String query = "Select * FROM Order o where o.users.id = ?1";
        return Database.doInTransaction(entityManager -> entityManager.createQuery(query, Order.class)
                .setParameter(1, user_id).getResultList());
    }

    @Transactional
    public Order createOrder(User user, CartOrderRequest cartOrderRequest, EntityManager entityManager) {
        ShippingAddress shippingAddress = new ShippingAddress(cartOrderRequest.address(), cartOrderRequest.city());
        Order order = new Order(user, user.getCarts().get(user.getCarts().size() - 1).calculateTotalPrice(), 1, cartOrderRequest.note(), shippingAddress);
        entityManager.persist(order);
        return order;
    }

    public CheckoutResponse OrderCart(User user, CartOrderRequest cartOrderRequest) {
        User currentUser = Database.doInTransaction(em -> em.find(User.class, user.getId()));

        //Create Order
        Order order = Database.doInTransaction(entityManager -> createOrder(currentUser, cartOrderRequest, entityManager));

        List<Orderitem> orderitems = new ArrayList<>();
        for (Cartitem cartitem : currentUser.getCarts().get(currentUser.getCarts().size() - 1).getCartitemses()) {
            Product product = Database.doInTransaction(em -> em.find(Product.class, cartitem.getId().getProductId()));
            if (UserProductRepository.updateProductQuantity(product.getProductId(), cartitem.getQuantity())) {
                orderitems.add(new Orderitem(new OrderitemsId(order.getOrderId(), cartitem.getId().getProductId()), cartitem.getQuantity(), product.getPrice()));
            }
        }

        order.setOrderitemses(orderitems);
        //persist order
        Database.doInTransactionWithoutResult(entityManager -> entityManager.merge(order));

        CheckoutResponse checkoutResponse = new CheckoutResponse(order.getOrderId(), CartService.getInstance().getCartProducts(user).getProductDtos(), cartOrderRequest.address(), cartOrderRequest.city());

        CartService.getInstance().createNewCart(currentUser);

        return checkoutResponse;
    }

    public CheckoutResponse orderSingleProduct(User user, SingleOrderRequest singleOrderRequest) {
        //Create Order
        ShippingAddress shippingAddress = new ShippingAddress(singleOrderRequest.address(), singleOrderRequest.city());
        Order order = Database.doInTransaction(em -> em.merge(new Order(user, singleOrderRequest.price(), 1, singleOrderRequest.note(), shippingAddress)));
        //Add product to order item
        Orderitem orderitem = new Orderitem(new OrderitemsId(order.getOrderId(), singleOrderRequest.id()), singleOrderRequest.quantity(), singleOrderRequest.price());
        Database.doInTransactionWithoutResult(entityManager -> entityManager.persist(orderitem));
        boolean hasEnoughProduct = UserProductRepository.updateProductQuantity(singleOrderRequest.id(), singleOrderRequest.quantity());
        if (hasEnoughProduct) {
            List<CartProductDto> cartProductDtos = new ArrayList<>();
            CartProductDto cartProductDto = new CartProductDto(singleOrderRequest.id(), singleOrderRequest.name(), singleOrderRequest.price(), singleOrderRequest.quantity());
            cartProductDto.setImage(singleOrderRequest.image());
            cartProductDtos.add(cartProductDto);
            CheckoutResponse response = new CheckoutResponse(order.getOrderId(), cartProductDtos, singleOrderRequest.address(), singleOrderRequest.city());
            return response;
        } else {
            return null;
        }
    }

    public boolean cancelOrder(int order_id) {
        //Update Product Quantity
        Order order = Database.doInTransaction(entityManager -> entityManager.find(Order.class, order_id));
        order.getOrderitemses().forEach(orderitem -> {
            UserProductRepository.updateProductQuantity(orderitem.getId().getProductId(), orderitem.getQuantity() * -1);
        });
        try {
            Database.doInTransactionWithoutResult(em -> em.remove(em.find(Order.class, order_id)));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public List<Order> getOrders(int user_id) {
        String query = "FROM Order o where o.users.id = ?1";
        return Database.doInTransaction(entityManager -> entityManager.createQuery(query, Order.class)
                .setParameter(1, user_id)
                .getResultList());
    }


    public boolean updateOrderStatus(int order_id, OrderStatus orderStatus) {
        String query = "Update Order o set status = ?1 where o.orderId = ?2";
        return Database.doInTransaction(em -> em.createQuery(query)
                .setParameter(1, orderStatus.orderStatus)
                .setParameter(2, order_id)
                .executeUpdate() > 0);
    }


}
