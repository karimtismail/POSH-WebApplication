package com.posh.service;

import com.posh.dtos.cartdtos.CartProductsResponse;
import com.posh.model.Cart;
import com.posh.model.Cartitem;
import com.posh.model.CartitemsId;
import com.posh.model.User;
import com.posh.persistance.repository.implementations.CartDao;
import com.posh.persistance.Database;
import jakarta.servlet.annotation.WebServlet;

import java.util.Date;

public class CartService {
    private static CartService instance;
    private CartDao cartDao;

    private CartService() {
        cartDao = new CartDao();
    }

    public static CartService getInstance() {
        if (instance == null)
            instance = new CartService();
        return instance;
    }

    public boolean UpdateCartDate(User user) {
        int cart_id = Database.doInTransaction(entityManager -> cartDao.findLastCart(user.getId()).getCartId());
        String query = "Update Cart c set c.checkOutDate = ?1 where c.cartId = ?2";
        return Database.doInTransaction(entityManager -> entityManager.createQuery(query)
                .setParameter(1, new Date())
                .setParameter(2, cart_id)
                .executeUpdate() > 0);
    }

    public User createNewCart(User user) {
        //Then Update last one end date
        UpdateCartDate(user);
        Cart cart = new Cart(user, new Date(), null);
        Database.doInTransactionWithoutResult(em -> cartDao.insertCart(cart, em));
        return Database.doInTransaction(em -> em.merge(user));
    }

    public String addProductToCart(int product_id, User user, int quantity) {
        Cart cart = cartDao.findLastCart(user.getId());
        System.out.println(cart + " , " + user.getId());
        CartitemsId cartitemsId = new CartitemsId(cart.getCartId(), product_id);
        Cartitem cartitem = new Cartitem(cartitemsId, quantity);
        return cartDao.addProductToCart(user.getId(), cartitem);
    }

    public boolean removeProductFromCart(int product_id, User user) {
        Cart cart = cartDao.findLastCart(user.getId());
        return cartDao.removeProductFromCart(cart.getCartId(), product_id);
    }

    public boolean updateCartProduct(int product_id, User user, int quantity) {
        Cart cart = cartDao.findLastCart(user.getId());
        return cartDao.updateCartProduct(cart.getCartId(), product_id, quantity);
    }

    public CartProductsResponse getCartProducts(User user) {
        CartProductsResponse cartProductsResponse = new CartProductsResponse();
        int cart_id = cartDao.insertCartOrGetLast(user);
        System.out.println("curernt_cart_id : " +cart_id);
        //return response
        cartProductsResponse.setProductDtos(cartDao.findCartItems(cart_id));
        return cartProductsResponse;
    }

}
