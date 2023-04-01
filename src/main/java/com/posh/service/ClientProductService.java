package com.posh.service;

import com.posh.dtos.productdtos.FullProductDto;
import com.posh.dtos.productdtos.HomeProduct;
import com.posh.persistance.Database;
import com.posh.persistance.repository.implementations.UserProductRepository;
import com.posh.dtos.FilterRecord;
import com.posh.utils.Mapper.Mapper;

import java.util.List;

public class ClientProductService {
    private static ClientProductService instance;

    private ClientProductService() {
    }

    public static ClientProductService getInstance() {
        if (instance == null)
            instance = new ClientProductService();
        return instance;
    }
    public List<HomeProduct> FilterProduct(FilterRecord filterRecord) {
        return Mapper.listMapping(Database.doInTransaction(entityManager -> UserProductRepository.filterProducts(filterRecord, entityManager)),
                HomeProduct.class);
    }

    public FullProductDto findProductByID(int productId){
        return Mapper.objectMapping(Database.doInTransaction(entityManager -> UserProductRepository.getProduct(productId, entityManager))
                ,FullProductDto.class);
    }

    public List<HomeProduct> findPopularProducts() {
        return Mapper.listMapping(Database.doInTransaction(entityManager -> UserProductRepository.findPopularProducts()),
                HomeProduct.class);
    }
}
