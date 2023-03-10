package com.posh.model;

import jakarta.persistence.*;

@Entity
@Table(name = "oil_category", schema = "posh", catalog = "")
public class OilCategoryEntity {
    private Integer id;
    private Integer km;
    private String type;
    private Double liter;
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

        OilCategoryEntity that = (OilCategoryEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (km != null ? !km.equals(that.km) : that.km != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (liter != null ? !liter.equals(that.liter) : that.liter != null) return false;
        if (prodId != null ? !prodId.equals(that.prodId) : that.prodId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (km != null ? km.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (liter != null ? liter.hashCode() : 0);
        result = 31 * result + (prodId != null ? prodId.hashCode() : 0);
        return result;
    }
}
