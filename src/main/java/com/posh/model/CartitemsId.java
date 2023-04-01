package com.posh.model;
// default package

// Generated Mar 12, 2023, 9:11:01 PM by Hibernate Tools 6.1.7.Final

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

/**
 * CartitemsId generated by hbm2java
 */
@Embeddable
public class CartitemsId implements java.io.Serializable {
    private int cartId;
    private int productId;

    public CartitemsId() {
    }

    public CartitemsId(int cartId, int productId) {
        this.cartId = cartId;
        this.productId = productId;
    }



    @Column(name="cart_id", nullable=false)
    public int getCartId() {
        return this.cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }


    @Column(name="product_id", nullable=false)
    public int getProductId() {
        return this.productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }


    public boolean equals(Object other) {
        if ( (this == other ) ) return true;
        if ( (other == null ) ) return false;
        if ( !(other instanceof CartitemsId) ) return false;
        CartitemsId castOther = ( CartitemsId ) other;

        return (this.getCartId()==castOther.getCartId())
                && (this.getProductId()==castOther.getProductId());
    }

    public int hashCode() {
        int result = 17;

        result = 37 * result + this.getCartId();
        result = 37 * result + this.getProductId();
        return result;
    }


}
