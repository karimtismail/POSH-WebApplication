package com.posh.model;

import jakarta.persistence.*;

@Entity
@Table(name = "batteries_category", schema = "posh", catalog = "")
public class BatteriesCategoryEntity {
    private Integer id;
    private Integer volt;
    private Integer ampere;
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
    @Column(name = "volt", nullable = true)
    public Integer getVolt() {
        return volt;
    }

    public void setVolt(Integer volt) {
        this.volt = volt;
    }

    @Basic
    @Column(name = "ampere", nullable = true)
    public Integer getAmpere() {
        return ampere;
    }

    public void setAmpere(Integer ampere) {
        this.ampere = ampere;
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

        BatteriesCategoryEntity that = (BatteriesCategoryEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (volt != null ? !volt.equals(that.volt) : that.volt != null) return false;
        if (ampere != null ? !ampere.equals(that.ampere) : that.ampere != null) return false;
        if (prodId != null ? !prodId.equals(that.prodId) : that.prodId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (volt != null ? volt.hashCode() : 0);
        result = 31 * result + (ampere != null ? ampere.hashCode() : 0);
        result = 31 * result + (prodId != null ? prodId.hashCode() : 0);
        return result;
    }
}
