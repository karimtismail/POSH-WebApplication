package com.posh.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "batteries_category", schema = "posh", catalog = "")
public class BatteriesCategoryEntity {
    private int id;
    private Integer volt;
    private Integer ampere;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BatteriesCategoryEntity that = (BatteriesCategoryEntity) o;

        if (id != that.id) return false;
        if (volt != null ? !volt.equals(that.volt) : that.volt != null) return false;
        if (ampere != null ? !ampere.equals(that.ampere) : that.ampere != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (volt != null ? volt.hashCode() : 0);
        result = 31 * result + (ampere != null ? ampere.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "batteriesCategoryByBatteriesId")
    public Collection<CategoriesEntity> getCategoriesById() {
        return categoriesById;
    }

    public void setCategoriesById(Collection<CategoriesEntity> categoriesById) {
        this.categoriesById = categoriesById;
    }
}
