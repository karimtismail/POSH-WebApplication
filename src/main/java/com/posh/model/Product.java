package com.posh.model;

import jakarta.persistence.*;

import static jakarta.persistence.GenerationType.IDENTITY;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.annotations.BatchSize;


@Entity
@Table(name = "products"
        , catalog = "posh"
        , uniqueConstraints = @UniqueConstraint(columnNames = "sku")
)
public class Product {
    private Integer productId;
    private Category category;
    private String name;
    private String description;
    private String sku;
    private BigDecimal price;
    private Integer quantity;
    private String vendor;
    private String brand;
    private String madeIn;
    private List<Image> images = new ArrayList<>(0);
    private List<Orderitem> orderItems = new ArrayList<>(0);

    public Product() {
    }

    public Product(Category category, String name, String description, String sku, BigDecimal price, Integer quantity, String vendor, String brand, String madeIn, List<Image> images) {
        this.category = category;
        this.name = name;
        this.description = description;
        this.sku = sku;
        this.price = price;
        this.quantity = quantity;
        this.vendor = vendor;
        this.brand = brand;
        this.madeIn = madeIn;
        this.images = images;
    }

    public Product(Category category, String name, String description, String sku, BigDecimal price, Integer quantity, String vendor, String brand, String madeIn, List<Image> image, List<Orderitem> orderItems) {
        this.category = category;
        this.name = name;
        this.description = description;
        this.sku = sku;
        this.price = price;
        this.quantity = quantity;
        this.vendor = vendor;
        this.brand = brand;
        this.madeIn = madeIn;
        this.images = image;
        this.orderItems = orderItems;
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

    @ManyToOne(fetch = FetchType.EAGER)
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
    public BigDecimal getPrice() {
        return this.price;
    }

    public void setPrice(BigDecimal price) {
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

    @BatchSize(size = 4)
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "product_id", nullable = false)
    public List<Image> getImages() {
        return this.images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "products")
    public List<Orderitem> getOrderItems() {
        return this.orderItems;
    }

    public void setOrderItems(List<Orderitem> orderItems) {
        this.orderItems = orderItems;
    }
}