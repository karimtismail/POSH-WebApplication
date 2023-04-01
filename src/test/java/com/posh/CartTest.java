package com.posh;

import com.posh.model.*;
import com.posh.persistance.repository.implementations.CartDao;
import com.posh.persistance.Database;
import com.posh.service.CartService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Date;

public class CartTest {

    @Test
    public void update_checkoutDate_for_cart() {
        //Arrange
        User user = Database.doInTransaction(em -> em.find(User.class, 1));
        CartService cartService = CartService.getInstance();
        //Act
        boolean updated = cartService.UpdateCartDate(user);
        //Assert
        Assertions.assertTrue(updated);
    }

    @Test
    public void insert_Cart_for_User() {
        // Arrange
        CartDao cartDao = new CartDao();
        User user = Database.doInTransaction(em -> em.find(User.class, 1));
        Cart cart = new Cart(user, new Date(), null);
        // Act
        //cartDao.insertCart(cart);
        // Assert
        Cart result = Database.doInTransaction(em -> em.find(Cart.class, 1));
        Assertions.assertEquals(result.getUsers().getEmail(), cart.getUsers().getEmail());
    }

    @Test
    public void add_product_To_UserCart_with_quantity_biggerThenProduct() {
        // Arrange
        CartService cartService = CartService.getInstance();
        User user = Database.doInTransaction(em -> em.find(User.class, 3));
        Product product = Database.doInTransaction(em -> em.find(Product.class, 1));
        Product product2 = Database.doInTransaction(em -> em.find(Product.class, 2));
        int amount = 2;
        // Act
        String result = cartService.addProductToCart(product.getProductId(), user, amount);
        // Assert
        Assertions.assertEquals(result, "Successfully Added to cart");
    }

    @Test
    public void remove_Product_From_UserCart() {
        // Arrange
        CartService cartService = CartService.getInstance();
        User user = Database.doInTransaction(em -> em.find(User.class, 1));
        Product product = Database.doInTransaction(em -> em.find(Product.class, 1));
        // Act
        boolean isRemoved = cartService.removeProductFromCart(product.getProductId(), user);
        // Assert
        Assertions.assertTrue(isRemoved);
    }

    @Test
    public void update_Quantity_of_cartProduct() {
        // Arrange
        User user = Database.doInTransaction(em -> em.find(User.class, 1));
        CartService cartService = CartService.getInstance();
        int product_id = 1;
        int cart_id = 1;
        int amount = 5;
        // Act
        boolean isUpdated = cartService.updateCartProduct(cart_id, user, amount);
        // Assert
        Assertions.assertTrue(isUpdated);
    }

    @Test
    public void add_existCartProduct_To_Cart() {
        // Arrange
        User user = Database.doInTransaction(em -> em.find(User.class, 3));
        CartService cartService = CartService.getInstance();
        int product_id = 1;
        int cart_id = 1;
        int amount = 5;
        // ACT
        String isAdded = cartService.addProductToCart(product_id, user, amount);
        // Assert
        Assertions.assertTrue(isAdded.equals("Successfully Updated"));
    }

    @Test
    public void insert_or_get_cart_id() {
        //Ararnge
        User user = Database.doInTransaction(em -> em.find(User.class, 3));
        //Act
        CartDao cartDao = new CartDao();
        int cart_id = cartDao.insertCartOrGetLast(user);
        //Assert
        Assertions.assertEquals(cart_id, 10);
    }
}
