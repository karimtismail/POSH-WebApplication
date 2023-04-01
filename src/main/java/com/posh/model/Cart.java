package com.posh.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "cart", catalog = "posh")
public class Cart implements java.io.Serializable {
    private int cartId;
    private User users;
    private List<Cartitem> cartitemses = new ArrayList<>(0);
    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date creationDate;
    @Temporal(TemporalType.DATE)
    private Date checkOutDate;

    public Cart() {
    }

    public Cart(Date creationDate, Date checkOutDate) {
        this.creationDate = creationDate;
        this.checkOutDate = checkOutDate;
    }

    public Cart(User users, Date creationDate, Date checkOutDate) {
        this.users = users;
        this.creationDate = creationDate;
        this.checkOutDate = checkOutDate;
    }

    public Cart(User users, List<Cartitem> cartitemses, Date creationDate, Date checkOutDate) {
        this.users = users;
        this.cartitemses = cartitemses;
        this.creationDate = creationDate;
        this.checkOutDate = checkOutDate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CartID", unique = true, nullable = false)
    public int getCartId() {
        return this.cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }



    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "UserID", nullable = false)
    public User getUsers() {
        return users;
    }

    public void setUsers(User users) {
        this.users = users;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "cart")
    public List<Cartitem> getCartitemses() {
        return this.cartitemses;
    }

    public void setCartitemses(List<Cartitem> cartitemses) {
        this.cartitemses = cartitemses;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public BigDecimal calculateTotalPrice() {
        return cartitemses.stream()
                .map(cartitem -> cartitem.getProducts().getPrice().multiply(BigDecimal.valueOf(cartitem.getQuantity())))
                .reduce(BigDecimal::add).get();
    }

}