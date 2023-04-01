package com.posh.dtos;

import java.math.BigDecimal;
import java.math.BigInteger;

public record FilterRecord(int[] category, BigDecimal startPrice, BigDecimal EndPrice, int page, String searchName) {
}
