package com.posh.repository;

import com.posh.model.ProductsEntity;
import com.posh.utils.enums.CategotyEnum;
import com.posh.utils.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    static List<ProductsEntity> products = new ArrayList<>();

    public ProductRepository() {
     
    }

    public List<ProductsEntity> getProducts() {
        return products;
    }

    public List<ProductsEntity> getProductsByCategory(CategotyEnum categotyEnum) {
        return products.stream().filter((product) -> CategotyEnum.valueOf( product.getCategory()).getId() == categotyEnum.getId()).toList();
    }

    public void addProduct(ProductsEntity product) {
        System.out.println(product.getBrand());
        EntityManager entityManager = EntityManagerFactoryUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(product);
        entityManager.getTransaction().commit();

    }

    public void deleteProductById(ProductsEntity product) {
        EntityManager entityManager = EntityManagerFactoryUtil.getEntityManagerFactory().createEntityManager();
        entityManager.remove(product);
    }

}
