package com.posh.model;

import jakarta.persistence.*;

@Entity
@Table(name = "tires_category", schema = "posh", catalog = "")
public class TiresCategoryEntity {
    private Integer id;
    private Double width;
    private Double height;
    private Double diameter;
    private Integer prodId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    @Basic
    @Column(name = "prod_id", nullable = true)
    public Integer getProdId() {
        return prodId;
    }

    public void setProdId(Integer prodId) {
        this.prodId = prodId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TiresCategoryEntity that = (TiresCategoryEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (width != null ? !width.equals(that.width) : that.width != null) return false;
        if (height != null ? !height.equals(that.height) : that.height != null) return false;
        if (diameter != null ? !diameter.equals(that.diameter) : that.diameter != null) return false;
        if (prodId != null ? !prodId.equals(that.prodId) : that.prodId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (width != null ? width.hashCode() : 0);
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (diameter != null ? diameter.hashCode() : 0);
        result = 31 * result + (prodId != null ? prodId.hashCode() : 0);
        return result;
    }
}
