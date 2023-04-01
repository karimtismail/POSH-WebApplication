package com.posh.utils.Mapper.converterimpl;

import com.posh.dtos.productdtos.FullProductDto;
import com.posh.model.Product;
import com.posh.utils.Mapper.Mapper;

import java.util.function.Function;

public class ProductToFullProductDto implements Function<Product, FullProductDto> {
    @Override
    public FullProductDto apply(Product product) {
        return  new FullProductDto(
                product.getProductId(),
                product.getCategory().getId(),
                product.getName(),
                product.getDescription(),
                product.getSku(),
                product.getPrice(),
                product.getQuantity(),
                product.getVendor(),
                product.getBrand(),
                product.getMadeIn(),
                product.getImages()
                );}
}