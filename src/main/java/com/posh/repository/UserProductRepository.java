package com.posh.repository;

import java.util.List;
import java.util.Set;

import com.posh.model.Category;
import com.posh.model.Product;
import com.posh.network.EntityFactory;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

public class UserProductRepository {

    private static UserProductRepository instance;
    private EntityManager userProductEntityManager;

    private UserProductRepository() {
        userProductEntityManager = EntityFactory.getInstance("posh").getEntityManagerFactory().createEntityManager();
    }

    public static UserProductRepository getInstance() {
        if (instance == null)
            instance = new UserProductRepository();
        return instance;
    }

    public Product getProduct(int productID) {
        return userProductEntityManager.find(Product.class, productID);
    }

    public List<Product> getAllProduct() {
        Query productQuery = userProductEntityManager.createQuery("SELECT p From Product p");
        return productQuery.getResultList();
    }

    public Category getProductByCategory(int categoryID) {
        return userProductEntityManager.find(Category.class, categoryID);
    }

    public void getProductByPrice(int from, int to) {

    }

    public void getProductByVendor(String Vendor) {

    }

}
