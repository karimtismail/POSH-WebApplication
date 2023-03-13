package com.posh.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;

import static jakarta.persistence.GenerationType.IDENTITY;

import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;

import com.google.gson.annotations.Expose;


@Entity
@Table(name = "products"
        , catalog = "posh"
        , uniqueConstraints = @UniqueConstraint(columnNames = "sku")
)
public class Product implements java.io.Serializable {
    @Expose
    private Integer productId;
    @Expose
    private Category category;
    @Expose
    private String name;
    @Expose
    private String description;
    @Expose
    private String sku;
    @Expose
    private BigInteger price;
    @Expose
    private Integer quantity;
    @Expose
    private String vendor;
    @Expose
    private String brand;
    @Expose
    private String madeIn;
    @Expose
    private String image;
    private Set<Orderitem> orderItems = new HashSet<>(0);
    private Set<Cartitem> cartItems = new HashSet<>(0);

    public Product() {
    }

    public Product(Category category, String name, String description, String sku, BigInteger price, Integer quantity, String vendor, String brand, String madeIn, String image, Set<Orderitem> orderItems, Set<Cartitem> cartItems) {
        this.category = category;
        this.name = name;
        this.description = description;
        this.sku = sku;
        this.price = price;
        this.quantity = quantity;
        this.vendor = vendor;
        this.brand = brand;
        this.madeIn = madeIn;
        this.image = image;
        this.orderItems = orderItems;
        this.cartItems = cartItems;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "product_id", unique = true, nullable = false)
    public Integer getProductId() {
        return this.productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    public Category getCategory() {
        return this.category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }


    @Column(name = "name", length = 45)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @Column(name = "description", length = 100)
    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Column(name = "sku", unique = true, length = 10)
    public String getSku() {
        return this.sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }


    @Column(name = "price", precision = 20, scale = 0)
    public BigInteger getPrice() {
        return this.price;
    }

    public void setPrice(BigInteger price) {
        this.price = price;
    }


    @Column(name = "quantity")
    public Integer getQuantity() {
        return this.quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }


    @Column(name = "vendor", length = 45)
    public String getVendor() {
        return this.vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }


    @Column(name = "brand", length = 45)
    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }


    @Column(name = "made_in", length = 45)
    public String getMadeIn() {
        return this.madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }


    @Column(name = "image", length = 50)
    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
    public Set<Orderitem> getOrderItems() {
        return this.orderItems;
    }

    public void setOrderItems(Set<Orderitem> orderItems) {
        this.orderItems = orderItems;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
    public Set<Cartitem> getCartItems() {
        return this.cartItems;
    }

    public void setCartItems(Set<Cartitem> cartitemses) {
        this.cartItems = cartitemses;
    }


}


