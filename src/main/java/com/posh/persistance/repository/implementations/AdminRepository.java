package com.posh.persistance.repository.implementations;

import com.posh.dtos.ProductPerOrder;
import com.posh.dtos.UserFetchDto;
import com.posh.dtos.UserOrdersDto;
import com.posh.mappers.UserFetchMapper;
import com.posh.model.Order;
import com.posh.model.Orderitem;
import com.posh.model.User;
import com.posh.persistance.Database;
import jakarta.persistence.Query;

import java.util.ArrayList;
import java.util.List;

public class AdminRepository {

    private static AdminRepository instance;

    private AdminRepository() {
    }

    public static AdminRepository getInstance() {
        if (instance == null)
            instance = new AdminRepository();
        return instance;
    }

    public List<UserFetchDto> getUsers(){
        System.out.println("get users");
        Query query = Database.doInTransaction(em ->  em.createQuery("From User"));
        List<UserFetchDto> users = new ArrayList<>();
        for(User user: (List<User>) query.getResultList()){
            users.add(new UserFetchMapper().toDto(user));
        }
        System.out.println("size");
        System.out.println(users.size());
        return users;
    }

    public List<UserOrdersDto> getOrdersPerUser(int userId) {
        int i=0;
        User user = Database.doInTransaction(em ->  em.find(User.class, userId));
        List<UserOrdersDto> userOrdersDtoList = new ArrayList<>();
        List<ProductPerOrder> productPerOrderList;
        UserOrdersDto userOrdersDto;
        ProductPerOrder productPerOrder;

        for(Order order: user.getOrderses()){
            productPerOrderList = new ArrayList<>();
            for(Orderitem orderitem: order.getOrderitemses()){
                productPerOrder = new ProductPerOrder();
                productPerOrder.setQuantity(orderitem.getQuantity());
                productPerOrder.setName(orderitem.getProducts().getName());
                productPerOrderList.add(productPerOrder);
            }

            userOrdersDto = new UserOrdersDto();
            userOrdersDto.setOrderDate(order.getOrderDate());
            userOrdersDto.setTotalPrice(order.getTotalPrice());
            userOrdersDto.setId(++i);
            userOrdersDto.setShippingAddress(order.getShippingAddress().getAddress());
            userOrdersDto.setProducts(productPerOrderList);
            userOrdersDto.setOrderNotes(order.getOrder_notes());
            userOrdersDtoList.add(userOrdersDto);
        }
        return userOrdersDtoList;
    }

}
