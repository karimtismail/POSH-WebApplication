package com.posh;

import com.posh.model.Category;
import com.posh.model.Product;
import org.junit.jupiter.api.Test;

public class MapperTest {

    @Test
    public void convert_From_ProductToHomeProduct() {
        //Arrange
        Product product = new Product();
        product.setName("moamhed");
        product.setProductId(1);
        product.setBrand("Asgaf");
        product.setMadeIn("egy");
        product.setQuantity(55);
        product.setCategory(new Category("oil"));
        product.setSku("safafasff");
        product.setImages(null);

    }
}
