package com.posh.utils.Mapper.converterimpl;

import com.posh.dtos.productdtos.HomeProduct;
import com.posh.model.Product;

import java.util.function.Function;

public class ProductToHomeProductDto implements Function<Product, HomeProduct> {
    @Override
    public HomeProduct apply(Product product) {
        return  new HomeProduct(product.getProductId(),
                product.getName(),
                product.getPrice(),
                product.getSku(),
                product.getVendor(),
                product.getImages().get(0).getImageName(),
                product.getCategory().getId());}
}
