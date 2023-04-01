package com.posh.persistance.repository.implementations;

import com.posh.dtos.cartdtos.CartProductDto;
import com.posh.model.Cart;
import com.posh.model.Cartitem;
import com.posh.model.Product;
import com.posh.model.User;
import com.posh.persistance.Database;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class CartDao {
    @Transactional
    public Integer insertCart(Cart cart, EntityManager entityManager) {
        entityManager.persist(cart);
        return cart.getCartId();
    }
    public int insertCartOrGetLast(User user){
        if (user == null)
            throw new NullPointerException("User is null please check passed user");
        Cart cart = findLastCart(user.getId());
        int cart_id = -1;
        if(cart == null){
            cart_id = Database.doInTransaction(em -> insertCart(new Cart(user, new Date(), null), em));
        }else {
            cart_id = cart.getCartId();
        }
        return cart_id;
    }

    public String addProductToCart(int user_id, Cartitem cartitem) {
        Product product = Database.doInTransaction(entityManager -> entityManager.find(Product.class,
                cartitem.getId().getProductId()));

        boolean hasCreditLimit = hasCreditLimit(user_id, product.getPrice());

        if (product.getQuantity() >= cartitem.getQuantity() && hasCreditLimit) {

            try {
                Database.doInTransactionWithoutResult(entityManager -> entityManager.persist(cartitem));
                updateCreditLimit(user_id, product.getPrice().multiply(BigDecimal.valueOf(cartitem.getQuantity())));
                return "Successfully Added to cart";
            } catch (Exception e) {
                updateCreditLimit(user_id, product.getPrice().multiply(BigDecimal.valueOf(cartitem.getQuantity())));
                boolean isUpdated = updateCartProduct(cartitem.getId().getCartId(), cartitem.getId().getProductId(),
                        cartitem.getQuantity());
                return (isUpdated) ? "Successfully Updated" : "Fail To Add product To Cart";
            }
        } else {
            if (hasCreditLimit) {
                return "There are only " + product.getQuantity() + " on the stock";
            } else {
                return "your credit limit is not enough for this operation";
            }
        }
    }

    public boolean removeProductFromCart(int cartID, int productID) {
        try {
            return Database.doInTransaction(entityManager -> entityManager
                    .createQuery("DELETE FROM Cartitem c where c.cart.cartId = ?1 AND c.products.id = ?2")
                    .setParameter(1, cartID)
                    .setParameter(2, productID)
                    .executeUpdate()) > 0;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean updateCartProduct(int cartID, int productID, int quantity) {
        try {
            return Database.doInTransaction(entityManager -> entityManager
                    .createQuery(
                            "UPDATE Cartitem c set c.quantity = ?3 where c.cart.cartId = ?1 AND c.products.id = ?2")
                    .setParameter(1, cartID)
                    .setParameter(2, productID)
                    .setParameter(3, quantity)
                    .executeUpdate()) > 0;
        } catch (Exception exception) {
            return false;
        }
    }

    public List<CartProductDto> findCartItems(int cart_id) {
        String Query = "SELECT new com.posh.dtos.cartdtos.CartProductDto(p.productId, p.name, p.price, c.quantity) FROM Product p, Cartitem c WHERE  p.productId = c.id.productId AND c.id.cartId = ?1";
        List<CartProductDto> cartProductDtos = Database.doInTransaction(entityManager -> entityManager.createQuery(Query, CartProductDto.class)
                .setParameter(1, cart_id)
                .getResultList());
        cartProductDtos.forEach(cartProductDto -> {
            cartProductDto.setImage(getProductImage(cartProductDto.getId()));
        });
        return cartProductDtos;
    }

    public Cart findLastCart(int user_id) {
        String query = "FROM Cart c where c.users.id = ?1 order BY c.cartId DESC LIMIT 1";
        try{
            return Database.doInTransaction(entityManager -> entityManager.createQuery(query,Cart.class)
                    .setParameter(1, user_id)
                    .getSingleResult());
        }catch (Exception e) {
            return null;
        }
    }

    private String getProductImage(int product_id) {
        String query = "SELECT imageName FROM posh.images where product_id = ?1 limit 1;";
        return Database.doInTransaction(em -> em.createNativeQuery(query, String.class).setParameter(1, product_id)
                .getSingleResult()).toString();

    }

        public boolean updateCreditLimit(int user_id, BigDecimal poductPrice) {
        User user = Database.doInTransaction(em -> em.find(User.class, user_id));
        return Database.doInTransaction(em -> em.createQuery("Update User u set u.creditLimit = ?1 where u.id = ?2")
                .setParameter(1, new BigDecimal(user.getCreditLimit()).subtract(poductPrice))
                .setParameter(2, user_id)
                .executeUpdate() > 0);

    }

    public boolean hasCreditLimit(int user_id, BigDecimal poductPrice) {
        User user = Database.doInTransaction(em -> em.find(User.class, user_id));
        if (user.getCreditLimit() >= poductPrice.intValue()) {
            return true;
        } else {
            return false;
        }

    }
}
