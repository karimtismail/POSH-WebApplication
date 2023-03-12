package com.posh.repository.interfaces;

import com.posh.model.UsersEntity;

public interface UserRepo {
    void createUser(UsersEntity user);
    boolean checkIfEmailExists(String email);
}
