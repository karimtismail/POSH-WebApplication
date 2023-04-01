package com.posh.persistance.repository.implementations;

import java.util.ArrayList;
import java.util.List;

import com.posh.dtos.productdtos.HomeProduct;
import com.posh.model.Product;

import com.posh.persistance.Database;
import com.posh.utils.enums.CategotyEnum;
import com.posh.dtos.FilterRecord;
import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;

public class UserProductRepository {
    public static final int INCREASE_QUANTITY_FLAG = 1;
    public static final int DECREASE_QUANTITY_FLAG = 2;

    public static Product getProduct(int productID, EntityManager entityManager) {
        return entityManager.find(Product.class, productID);
    }


    public List<HomeProduct> getHomeProducts(int page, EntityManager entityManager) {
        int offset = (page == 0) ? 0 : (page - 1) * 10;
        System.out.println("page : " + page * 10 + ", offset = " + offset);
        return entityManager.createQuery("SELECT new com.posh.dtos.productdtos.HomeProduct(p.productId, p.name, p.price, p.sku, p.vendor, p.image, p.category) From FullProduct p order by p.name LIMIT ?1 OFFSET ?2", HomeProduct.class)
                .setParameter(1, page * 10)
                .setParameter(2, offset).getResultList();
    }

    public List<HomeProduct> getProductByCategory(int categoryID, int page, EntityManager entityManager) {
        int offset = (page == 0) ? 0 : (page - 1) * 10;
        return entityManager.createQuery("Select new com.posh.dtos.productdtos.HomeProduct(p.productId, p.name, p.price, p.sku, p.vendor, p.image, p.category) From FullProduct p where p.category.id = ?1 order by name asc LIMIT ?2 OFFSET ?3", HomeProduct.class)
                .setParameter(1, categoryID)
                .setParameter(2, page * 10)
                .setParameter(3, offset)
                .getResultList();
    }

    public List<Product> getProductByPrice(int from, int to, EntityManager entityManager) {
        return entityManager.createQuery("From FullProduct p where p.price between ?1 AND ?2", Product.class)
                .setParameter(1, from)
                .setParameter(2, to)
                .getResultList();
    }

    public List<Product> getProductByVendor(String vendor, EntityManager entityManager) {
        return entityManager.createQuery("From FullProduct p where p.vendor = ?1", Product.class)
                .setParameter(1, vendor)
                .getResultList();
    }

    public List<HomeProduct> searchForProduct(String name, EntityManager entityManager) {
        return entityManager.createQuery("SELECT new com.posh.dtos.productdtos.HomeProduct(p.productId, p.name, p.price, p.sku, p.vendor, p.image, p.category) From FullProduct p where p.name LIKE CONCAT(?1,'%')", HomeProduct.class)
                .setParameter(1, name).getResultList();
    }

    public static List<Product> filterProducts(FilterRecord filterRecord, EntityManager entityManager) {
        int offset = (filterRecord.page() == 0) ? 0 : (filterRecord.page() - 1) * 10;
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> homeProductCriteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root<Product> productRoot = homeProductCriteriaQuery.from(Product.class);

        List<Predicate> predicates = new ArrayList<>();
        Predicate pricePredicate = criteriaBuilder.between(productRoot.get("price"), filterRecord.startPrice(), filterRecord.EndPrice());
        Predicate namePredicate = criteriaBuilder.like(productRoot.get("name"), filterRecord.searchName() + "%");

        predicates.add(pricePredicate);
        predicates.add(namePredicate);


        Predicate nameAndPricePredicate = criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        Predicate fullPredicate = null;
        if (filterRecord.category()[0] != CategotyEnum.ALL.getId()) {
            //Category Predicate
            List<Predicate> categoryPredicates = new ArrayList<>();
            for (int i = 0; i < filterRecord.category().length; i++) {
                categoryPredicates.add(criteriaBuilder.equal(productRoot.get("category").<Integer>get("id"), filterRecord.category()[i]));
            }
            fullPredicate = criteriaBuilder.and(nameAndPricePredicate, criteriaBuilder.or(categoryPredicates.toArray(new Predicate[0])));
        } else {
            fullPredicate = criteriaBuilder.and(nameAndPricePredicate);
        }

        homeProductCriteriaQuery.select(productRoot).where(fullPredicate);

        return entityManager.createQuery(homeProductCriteriaQuery)
                .setFirstResult(offset) // offset
                .setMaxResults(filterRecord.page() * 10) // limit
                .getResultList();
    }


    public static synchronized boolean updateProductQuantity(int product_id, int quantity) {
        Product product = Database.doInTransaction(em -> em.find(Product.class, product_id));
        if(product.getQuantity() < quantity)
            return false;
        String query = "UPDATE Product p set p.quantity = ?1 where p.productId = ?2";
        return  Database.doInTransaction(entityManager -> entityManager.createQuery(query)
                .setParameter(1, product.getQuantity() - quantity)
                .setParameter(2, product_id)
                .executeUpdate() > 0);
    }

    public static List<Product> findPopularProducts() {
        String query = "SELECT p FROM Product p, Orderitem o where p.productId = o.products.productId group by p.productId order by count(o.products.productId) DESC";
        return Database.doInTransaction(entityManager -> entityManager.createQuery(query, Product.class)
                .getResultList());
    }
}