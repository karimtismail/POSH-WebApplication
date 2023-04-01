package com.posh.utils.Mapper;

import com.posh.dtos.orderdtos.OrderDto;
import com.posh.dtos.productdtos.FullProductDto;
import com.posh.dtos.productdtos.HomeProduct;
import com.posh.utils.Mapper.converterimpl.OrderToOrderDto;
import com.posh.utils.Mapper.converterimpl.ProductToFullProductDto;
import com.posh.utils.Mapper.converterimpl.ProductToHomeProductDto;

import java.util.List;
import java.util.function.Function;

public class Mapper {
    public static  <T,R> List<R> listMapping(List<T> sourceList, Class<R> destination){
        return sourceList.stream()
                .map(getTargetImpl(destination))
                .toList();
    }

    public static <T,R> R objectMapping(T source, Class<R> destination){
        return getTargetImpl(destination).apply(source);
    }

    public static  <T,R> Function<T,R> getTargetImpl(Class<R> destination){
        Function<T,R> impl = null;
        if(destination == HomeProduct.class){
            impl = (Function<T, R>) new ProductToHomeProductDto();
        } else if(destination == FullProductDto.class){
            System.out.println("full");
            impl = (Function<T, R>) new ProductToFullProductDto();
        } else if(destination == OrderDto.class){
            impl = (Function<T, R>) new OrderToOrderDto();
        }
        return impl;
    }
}
