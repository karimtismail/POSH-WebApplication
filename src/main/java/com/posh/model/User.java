package com.posh.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Getter;

import java.util.*;

@Entity
@Getter
@Table(name = "users", catalog = "posh", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User implements java.io.Serializable {
    private int id;
    private String username;
    private String email;
    private Date dateOfBirth;
    private String password;
    private String gender;
    private String phoneNum;
    private String address;
    private String city;
    private int creditLimit;
    private List<Payment> payments = new ArrayList<>(0);
    private List<Cart> carts = new ArrayList<>(0);
    private List<Order> orderses = new ArrayList<>(0);

    public User() {
    }

    public User(int id, String username, String email, Date dateOfBirth, String password,
                String gender, String phoneNum, String address, String city, int creditLimit) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.password = password;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.address = address;
        this.city = city;
        this.creditLimit = creditLimit;
    }

    public User(String username, String email, Date dateOfBirth, String password,
                String gender, String phoneNum, String address, String city, int creditLimit) {
        this.username = username;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.password = password;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.address = address;
        this.city = city;
        this.creditLimit = creditLimit;
    }

    public User(int id, String username, String email, Date dateOfBirth, String password,
                String gender, String phoneNum, String address, String city, int creditLimit, List<Cart> carts, List<Order> orderses) {
        this.id = id;
        this.username = username;
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

    @NotNull(message = "Name cannot be null")
    @Pattern(regexp = "^[A-Za-z]+([\\sA-Za-z]+)*$", message = "Your name must be valid")
    @Column(name = "username", length = 30)
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Email(message = "Email should be valid")
    @Column(name = "email", unique = true, length = 30)
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @NotNull(message = "Date of birth cannot be null")
    @Temporal(TemporalType.DATE)
    @Past
    @Column(name = "date_of_birth", nullable = false, length = 10)
    public Date getDateOfBirth() {
        return this.dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @NotNull(message = "password cannot be null")
    @Column(name = "password", nullable = false, length = 60)
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

    @NotNull(message = "Phone Number cannot be null")
    @Pattern(regexp = "^01[0125][0-9]{8}$", message = "Phone number must be valid")
    @Column(name = "phone_num", nullable = false, length = 20)
    public String getPhoneNum() {
        return this.phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    @NotNull(message = "Address cannot be null")
    @Size(min = 15, max = 200, message = "Address must be between 15 and 200 characters")
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

    @NotNull(message = "Credit Limit cannot be null")
    @Min(1000)
    @Max(100000)
    @Column(name = "credit_limit", nullable = false)
    public int getCreditLimit() {
        return this.creditLimit;
    }

    public void setCreditLimit(int creditLimit) {
        this.creditLimit = creditLimit;
    }

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "users")
    public List<Cart> getCarts() {
        return this.carts;
    }

    public void setCarts(List<Cart> carts) {
        this.carts = carts;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
    public List<Order> getOrderses() {
        return this.orderses;
    }

    public void setOrderses(List<Order> orderses) {
        this.orderses = orderses;
    }

    @OneToMany(fetch = FetchType.LAZY)
    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }
}
