package com.posh.model;

import com.google.gson.annotations.Expose;
import jakarta.persistence.*;

@Entity
@Table(name = "images", catalog = "posh")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, unique = true)
    private int id;

    @Expose
    @Column(nullable = false)
    private String imageName;

    public Image() {
    }

    public Image(String imageName) {
        this.imageName = imageName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

}
