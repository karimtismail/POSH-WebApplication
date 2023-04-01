package com.posh.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class UserFetchDto  {
    int id;
    String username;
    String address;
    String city;
    String phoneNumber;
    String email;

    Date dob;

    int creditLimit;

}
