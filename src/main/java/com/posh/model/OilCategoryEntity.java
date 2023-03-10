package com.posh.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "oil_category", schema = "posh", catalog = "")
public class OilCategoryEntity {
    private int id;
    private Integer km;
    private String type;
    private Double liter;
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
    @Column(name = "km", nullable = true)
    public Integer getKm() {
        return km;
    }

    public void setKm(Integer km) {
        this.km = km;
    }

    @Basic
    @Column(name = "type", nullable = true, length = 45)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "liter", nullable = true, precision = 0)
    public Double getLiter() {
        return liter;
    }

    public void setLiter(Double liter) {
        this.liter = liter;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OilCategoryEntity that = (OilCategoryEntity) o;

        if (id != that.id) return false;
        if (km != null ? !km.equals(that.km) : that.km != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (liter != null ? !liter.equals(that.liter) : that.liter != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (km != null ? km.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (liter != null ? liter.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "oilCategoryByOilId")
    public Collection<CategoriesEntity> getCategoriesById() {
        return categoriesById;
    }

    public void setCategoriesById(Collection<CategoriesEntity> categoriesById) {
        this.categoriesById = categoriesById;
    }
}
