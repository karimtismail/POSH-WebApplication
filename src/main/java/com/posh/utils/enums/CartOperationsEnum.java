package com.posh.utils.enums;

public enum CartOperationsEnum {
    ADD_TO_CART(1),
    REMOVE_FROM_CART(2),
    UPDATE_CART(3);

    public int id;
    CartOperationsEnum(int id) {
        this.id = id;
    }
}
