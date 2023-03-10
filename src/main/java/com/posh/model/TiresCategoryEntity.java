package com.posh.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "tires_category", schema = "posh", catalog = "")
public class TiresCategoryEntity {
    private int id;
    private Double width;
    private Double height;
    private Double diameter;
    private Collection<CategoriesEntity> categoriesById;

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
    @Column(name = "width", nullable = true, precision = 0)
    public Double getWidth() {
        return width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }

    @Basic
    @Column(name = "height", nullable = true, precision = 0)
    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    @Basic
    @Column(name = "diameter", nullable = true, precision = 0)
    public Double getDiameter() {
        return diameter;
    }

    public void setDiameter(Double diameter) {
        this.diameter = diameter;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TiresCategoryEntity that = (TiresCategoryEntity) o;

        if (id != that.id) return false;
        if (width != null ? !width.equals(that.width) : that.width != null) return false;
        if (height != null ? !height.equals(that.height) : that.height != null) return false;
        if (diameter != null ? !diameter.equals(that.diameter) : that.diameter != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (width != null ? width.hashCode() : 0);
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (diameter != null ? diameter.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "tiresCategoryByTiersId")
    public Collection<CategoriesEntity> getCategoriesById() {
        return categoriesById;
    }

    public void setCategoriesById(Collection<CategoriesEntity> categoriesById) {
        this.categoriesById = categoriesById;
    }
}
