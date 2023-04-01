package com.posh.dtos.orderdtos;

import java.math.BigDecimal;

public record SingleOrderRequest(int id,
                                 BigDecimal price,
                                 int quantity,
                                 String city,
                                 String address,
                                 String note,
                                 String image,
                                 String name) {
}
