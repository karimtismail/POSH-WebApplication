package com.posh.model;

import jakarta.persistence.*;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users", catalog = "posh", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User implements java.io.Serializable {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private Date dateOfBirth;
    private String password;
    private String gender;
    private String phoneNum;
    private String address;
    private String city;
    private int creditLimit;
    private Set<Address> addresses = new HashSet<>(0);

    private Set<Payment> payments = new HashSet<>(0);
    private Set<Cart> carts = new HashSet<>(0);
    private Set<Order> orderses = new HashSet<>(0);

    public User() {
    }

    public User(int id, String firstName, String lastName, String email, Date dateOfBirth, String password,
                String gender, String phoneNum, String address, String city, int creditLimit) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.password = password;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.address = address;
        this.city = city;
        this.creditLimit = creditLimit;
    }

    public User(int id, String firstName, String lastName, String email, Date dateOfBirth, String password,
                String gender, String phoneNum, String address, String city, int creditLimit, Set<Cart> carts, Set<Order> orderses) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.password = password;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.address = address;
        this.city = city;
        this.creditLimit = creditLimit;
        this.carts = carts;
        this.orderses = orderses;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "first_name", nullable = false, length = 30)
    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "last_name", nullable = false, length = 30)
    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "email", unique = true, nullable = false, length = 30)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "date_of_birth", nullable = false, length = 10)
    public Date getDateOfBirth() {
        return this.dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Column(name = "password", nullable = false, length = 30)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "gender", nullable = false, length = 10)
    public String getGender() {
        return this.gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Column(name = "phone_num", nullable = false, length = 20)
    public String getPhoneNum() {
        return this.phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    @Column(name = "address", nullable = false, length = 45)
    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "city", nullable = false, length = 45)
    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name = "credit_limit", nullable = false)
    public int getCreditLimit() {
        return this.creditLimit;
    }

    public void setCreditLimit(int creditLimit) {
        this.creditLimit = creditLimit;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
    public Set<Cart> getCarts() {
        return this.carts;
    }

    public void setCarts(Set<Cart> carts) {
        this.carts = carts;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
    public Set<Order> getOrderses() {
        return this.orderses;
    }

    public void setOrderses(Set<Order> orderses) {
        this.orderses = orderses;
    }

    @OneToMany(fetch = FetchType.EAGER)
    public Set<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }

    @OneToMany(fetch = FetchType.LAZY)
    public Set<Payment> getPayments() {
        return payments;
    }

    public void setPayments(Set<Payment> payments) {
        this.payments = payments;
    }
}
