package com.posh.persistance.repository.interfaces;

import com.posh.model.User;

import java.util.Optional;

public interface UserRepo {
    boolean createUser(User user);

    boolean checkIfEmailExists(String email);

    User getUser(String email, String password);

    User getUser(String email);

    String getPasswordHash(String email);

    boolean updateUser(User user);

    boolean updatePasswordUser(User user);
}
