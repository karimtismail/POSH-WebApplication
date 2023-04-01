package com.posh.persistance.repository.implementations;

import java.util.List;

import com.posh.dtos.productdtos.FullProductDto;
import com.posh.model.Category;
import com.posh.model.Product;

import com.posh.persistance.Database;
import com.posh.service.ProductService;
import com.posh.utils.Mapper.Mapper;
import jakarta.persistence.Query;

public class AdminPoductRepository {
    ProductService productService;
    private static AdminPoductRepository instance;

    private AdminPoductRepository() {
    }

    public static AdminPoductRepository getInstance() {
        if (instance == null)
            instance = new AdminPoductRepository();
        return instance;
    }

    public Product getProduct(int productID) {
        return Database.doInTransaction(em ->  em.find(Product.class, productID));
    }

    public List<FullProductDto> getAllProduct(int pageNum) {
        Query productQuery = Database.doInTransaction(em ->  em.createQuery("From Product"));
        productQuery.setFirstResult((pageNum - 1) * 12);
        productQuery.setMaxResults(12);
        Long allPagesCount = getPagesCount();
        List<FullProductDto> fullProductDtos = Mapper.listMapping(productQuery.getResultList(), FullProductDto.class);
        ((fullProductDtos.get(0))).setPageNumber(allPagesCount);
        return fullProductDtos;
    }

    public Category getProductByCategory(int categoryID) {
        return Database.doInTransaction(em ->  em.find(Category.class, categoryID));
    }

    public boolean editProduct(Product product) {
        System.out.println(product.getName());
      productService = new ProductService();
        Product prod = Database.doInTransaction(em ->  em.find(Product.class, product.getProductId()));
        System.out.println("ooo: "+ prod.getName());
        if(prod != null) {
            boolean isValid = productService.validateProduct(prod);
            System.out.println(isValid);
            if (isValid) {
                productService.preprocessingData(product);
                Database.doInTransaction(em ->  em.merge(product));
                return true;
            }
        }
        return false;
    }

    public Long addProduct(Product product) {
        productService = new ProductService();
        boolean isValid = productService.validateProduct(product);
        if(isValid) {
            Database.doInTransactionWithoutResult(em ->  em.persist(product));
            Long totalPagesCount = getPagesCount();
            return totalPagesCount;
        }
        return null;
    }

    public boolean validateSku(String sku) {
        Query query = Database.doInTransaction(em ->  em.createQuery("FROM Product p WHERE p.sku = '" + sku + "'"));
        query.setMaxResults(1);

        if (query.getResultList().size() > 0) {
            return true;
        }
        return false;
    }

    private Long getPagesCount(){
        Query queryTotal = Database.doInTransaction(em ->  em.createQuery("select  count(p.productId) From Product p"));
        Long totalProductsCount = (Long) queryTotal.getSingleResult();
        final int productsCountPerPage = 12;
        Long totalPagesCount = 0l;
        if (totalProductsCount % productsCountPerPage != 0) {
            totalPagesCount = (totalProductsCount / productsCountPerPage) + 1;
        } else {
            totalPagesCount = totalProductsCount / productsCountPerPage;
        }
        return totalPagesCount;
    }

    public boolean removeProduct(Integer productId){
        Product product = Database.doInTransaction(em ->  em.find(Product.class, productId));
        Database.doInTransactionWithoutResult(em ->  em.remove(product));
        return true;
    }

    public Product getProductByPage(int pageNumber) {
        Query productQuery = Database.doInTransaction(em ->  em.createQuery("From Product"));
        productQuery.setFirstResult((pageNumber - 1) * 12);
        productQuery.setMaxResults(1);
        return (Product) productQuery.getSingleResult();
    }
}
