package com.posh.dtos;

import lombok.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserOrdersDto {

    int id;
    List<ProductPerOrder> products = new ArrayList<>();
    Date orderDate;

    BigDecimal totalPrice;
    String orderNotes;
    String shippingAddress;

}
