package com.posh.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "liquid_category", schema = "posh", catalog = "")
public class LiquidCategoryEntity {
    private int id;
    private String color;
    private Integer liter;
    private String carName;
    private Collection<CategoriesEntity> categoriesById;
    private Collection<ProductCategoriesEntity> productCategoriesById;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "color", nullable = true, length = 45)
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Basic
    @Column(name = "liter", nullable = true)
    public Integer getLiter() {
        return liter;
    }

    public void setLiter(Integer liter) {
        this.liter = liter;
    }

    @Basic
    @Column(name = "car_name", nullable = true, length = 45)
    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LiquidCategoryEntity that = (LiquidCategoryEntity) o;

        if (id != that.id) return false;
        if (color != null ? !color.equals(that.color) : that.color != null) return false;
        if (liter != null ? !liter.equals(that.liter) : that.liter != null) return false;
        if (carName != null ? !carName.equals(that.carName) : that.carName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (color != null ? color.hashCode() : 0);
        result = 31 * result + (liter != null ? liter.hashCode() : 0);
        result = 31 * result + (carName != null ? carName.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "liquidCategoryByLiquidId")
    public Collection<CategoriesEntity> getCategoriesById() {
        return categoriesById;
    }

    public void setCategoriesById(Collection<CategoriesEntity> categoriesById) {
        this.categoriesById = categoriesById;
    }

    @OneToMany(mappedBy = "liquidCategoryByCategoryId")
    public Collection<ProductCategoriesEntity> getProductCategoriesById() {
        return productCategoriesById;
    }

    public void setProductCategoriesById(Collection<ProductCategoriesEntity> productCategoriesById) {
        this.productCategoriesById = productCategoriesById;
    }
}
