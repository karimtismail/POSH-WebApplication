package com.posh.utils;

import com.posh.model.Product;
import com.posh.utils.enums.CategotyEnum;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;

public class ProductValidation {

    public static boolean validateNotNullBrand(String brand) {
        if (brand==null||brand.trim().equals("") ) {
            return false;
        }
        return true;
    }

    public static boolean validateNotNullName(String name) {
        if (name==null|| name.trim().equals("")) {
            return false;
        }
        return true;
    }

    public static boolean validateNotNullMadeIn(String madeIn) {
        if ( madeIn ==null||madeIn.trim().equals("") ) {
            return false;
        }
        return true;
    }

    public static boolean validateNotNullVendor(String vendor) {
        if (vendor == null||vendor.trim().equals("")  ) {
            return false;
        }
        return true;
    }

    public static boolean validateNotNullPrice(BigDecimal price) {
        if (price==null||price.equals("")) {
            return false;
        }
        return true;
    }

    public static boolean validateNotNullQuantity(Integer quantity) {
        if (quantity == null||quantity.equals("")) {
            return false;
        }
        return true;
    }

    public static boolean validateNotNullSku(String sku) {
        if (sku == null||sku.trim().equals("") ) {
            return false;
        }
        return true;
    }
    public static boolean validateNotNullCategory(String category) {
        if (category.trim().equals("")) {
            return false;
        }
        return true;
    }


    public static boolean validCategory(String category) {
        if(!Arrays.stream(CategotyEnum.values()).anyMatch(c-> c.getName().equals(category))){
            return false;
        }
        return true;
    }
}
