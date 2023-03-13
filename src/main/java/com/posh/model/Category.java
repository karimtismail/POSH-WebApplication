package com.posh.model;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.annotations.Expose;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;

import static jakarta.persistence.GenerationType.IDENTITY;

import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.annotations.BatchSize;


@Entity
@Table(name = "category", catalog = "posh")
public class Category implements java.io.Serializable {
    @Expose
    private Integer id;
    @Expose
    private String name;
    @Expose(serialize = true, deserialize = true)
    private List<Product> products = new ArrayList<>(0);

    public Category() {
    }

    public Category(String name) {
        this.name = name;
    }

    public Category(String name, List<Product> productses) {
        this.name = name;
        this.products = productses;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "name", nullable = false, length = 45)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @BatchSize(size = 4)
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
    public List<Product> getProducts() {
        return this.products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

}
