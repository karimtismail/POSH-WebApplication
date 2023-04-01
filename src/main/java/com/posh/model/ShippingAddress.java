package com.posh.model;

import jakarta.persistence.*;

@Entity
@Table(name = "shippingaddress", catalog = "posh")
public class ShippingAddress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private int id;

    @Column(nullable = false)
    private String address;

    @Column(nullable = false)
    private String city;

    public ShippingAddress() {
    }

    public ShippingAddress(String address, String city) {
        this.address = address;
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
