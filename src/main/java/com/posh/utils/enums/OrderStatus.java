package com.posh.utils.enums;

public enum OrderStatus {
    CANCEL(0),
    INPROGRESS(1),
    COMPLETE(2);

    public int orderStatus;

    OrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public static OrderStatus getOrderStatus(int orderStatusId){
        switch (orderStatusId){
            case 0 :
                return OrderStatus.CANCEL;
            case 1:
                return OrderStatus.INPROGRESS;
            case 2:
                return OrderStatus.COMPLETE;
            default:
                return null;
        }
    }
}
