package com.posh.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "plugs_category", schema = "posh", catalog = "")
public class PlugsCategoryEntity {
    private int id;
    private String carName;
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

        PlugsCategoryEntity that = (PlugsCategoryEntity) o;

        if (id != that.id) return false;
        if (carName != null ? !carName.equals(that.carName) : that.carName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (carName != null ? carName.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "plugsCategoryByPlugsId")
    public Collection<CategoriesEntity> getCategoriesById() {
        return categoriesById;
    }

    public void setCategoriesById(Collection<CategoriesEntity> categoriesById) {
        this.categoriesById = categoriesById;
    }
}
