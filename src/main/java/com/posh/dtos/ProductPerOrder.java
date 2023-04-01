package com.posh.dtos;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class ProductPerOrder {
    String name;
    int quantity;
}
