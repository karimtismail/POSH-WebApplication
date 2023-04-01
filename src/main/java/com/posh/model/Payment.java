package com.posh.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "payment", catalog = "posh")
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private int id;
    @Column(name = "card_number", unique = true, nullable = false)
    private String cardNumber;
    @Column(name = "expireDate", nullable = false)
    private Date expireDate;
    @Column(name = "cvv", unique = true, nullable = false)
    private String cvv;

    public Payment() {
    }

    public Payment(String cardNumber, Date expireDate, String cvv) {
        this.cardNumber = cardNumber;
        this.expireDate = expireDate;
        this.cvv = cvv;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
}
