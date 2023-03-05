package com.posh.repository;

import com.posh.model.Product;
import com.posh.utils.CategotyEnum;

import java.util.ArrayList;
import java.util.List;

public class FakeProductRepository {
    List<Product> products = new ArrayList<>();
    public FakeProductRepository() {
        for (int i = 0; i <= 5; i++) {
            products.add(new Product(i, "o" + i, "5/10", CategotyEnum.OIL.getId(), "safsafasfasf", 5,
                    55 + i, "5454", "BRX", "ss", "EGYPT","image"));
        }

        for (int i = 0; i <= 5; i++) {
            products.add(new Product(i, "b" + i, "5/10", CategotyEnum.BATTERY.getId(), "safsafasfasf", 5,
                    55 + i, "5454", "BRX", "ss", "EGYPT", "image"));        }

        for (int i = 0; i <= 5; i++) {
            products.add(new Product(i, "p" + i, "5/10", CategotyEnum.PLUG.getId(), "safsafasfasf", 5,
                    55 + i, "5454", "BRX", "ss", "EGYPT","image"));        }

        for (int i = 0; i <= 5; i++) {
            products.add(new Product(i, "l" + i, "5/10", CategotyEnum.LIQUID.getId(), "safsafasfasf", 5,
                    55 + i, "5454", "BRX", "ss", "EGYPT","image"));        }

        for (int i = 0; i <= 5; i++) {
            products.add(new Product(i, "t" + i, "5/10", CategotyEnum.TIER.getId(), "safsafasfasf", 5,
                    55 + i, "5454", "BRX", "ss", "EGYPT","image"));
        }
    }

    public List<Product> getProducts() {
        return products;
    }

    public List<Product> getProductsByCategory(CategotyEnum categotyEnum){
        return products.stream().filter((product) -> product.getCategory_id() == categotyEnum.getId()).toList();
    }

    public boolean addProduct(Product product){
        return products.add(product);
    }
}
