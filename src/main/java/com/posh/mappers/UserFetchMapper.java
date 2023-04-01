package com.posh.mappers;

import com.posh.dtos.UserFetchDto;
import com.posh.model.User;

public class UserFetchMapper {

    public UserFetchDto toDto(User user) {
        UserFetchDto userFetchDto = new UserFetchDto();
        return userFetchDto.builder()
                .dob(user.getDateOfBirth())
                .address(user.getAddress())
                .city(user.getCity())
                .creditLimit(user.getCreditLimit())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNum())
                .username(user.getUsername())
                .id(user.getId())
                .build();

    }
}
