package com.posh.persistance.repository.implementations;

import com.posh.model.User;
import com.posh.persistance.Database;
import com.posh.persistance.repository.interfaces.UserRepo;
import jakarta.persistence.*;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;

import java.util.Set;

public class UserRepoImpl implements UserRepo {


    private UserRepoImpl() {
    }

    public static UserRepo getUserRepo() {
        return new UserRepoImpl();
    }

    @Override
    public boolean createUser(User user) {
        return Database.doInTransaction(entityManager -> {
            Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
            Set<ConstraintViolation<User>> violations = validator.validate(user);
            if (!violations.isEmpty()) {
                System.out.println("Validation failed:");
                for (ConstraintViolation<User> violation : violations) {
                    System.out.println(violation.getPropertyPath() + " " + violation.getMessage());
                }
                return false;
            }
            entityManager.persist(user);
            return true;
        });
    }

    @Override
    public boolean checkIfEmailExists(String email) {
        if (email == null) {
            throw new IllegalArgumentException("Email cannot be null!!");
        }
        return Database.doInTransaction(entityManager -> {
            Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email");
            query.setMaxResults(1);
            query.setParameter("email", email);
            if (query.getResultList().size() > 0) {
                return true;
            }
            return false;
        });

    }

    @Override
    public User getUser(String email, String password) {
        if (email == null || password == null) {
            throw new IllegalArgumentException("Email or password cannot be null!!");
        }
        return Database.doInTransaction(entityManager -> {
            Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password");
            query.setParameter("email", email);
            query.setParameter("password", password);
            return (User) query.getSingleResult();
        });
    }

    @Override
    public User getUser(String email) {
        if (email == null) {
            throw new IllegalArgumentException("Email cannot be null!!");
        }
        return Database.doInTransaction(entityManager -> {
            Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email");
            query.setParameter("email", email);
            return (User) query.getSingleResult();
        });
    }

    @Override
    public String getPasswordHash(String email) {
        return Database.doInTransaction(entityManager -> {
            Query query = entityManager.createQuery("SELECT u.password FROM User u WHERE u.email = :email");
            query.setParameter("email", email);
            System.out.println((String) query.getSingleResult());
            return (String) query.getSingleResult();
        });
    }

    @Override
    public boolean updateUser(User user) {
        if (user == null) {
            System.err.println("User is null.");
            return false;
        }

        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<User>> violations = validator.validate(user);
        if (!violations.isEmpty()) {
            System.out.println("Validation failed:");
            for (ConstraintViolation<User> violation : violations) {
                System.out.println(violation.getPropertyPath() + " " + violation.getMessage());
            }
            return false;
        }

        return Database.doInTransaction(entityManager -> {
            Query query = entityManager.createQuery("UPDATE User u SET u.username=:username, u.phoneNum=:phoneNumber, u.password=:password, u.address=:address, u.creditLimit=:creditLimit WHERE u.email=:email")
                    .setParameter("username", user.getUsername())
                    .setParameter("phoneNumber", user.getPhoneNum())
                    .setParameter("password", user.getPassword())
                    .setParameter("address", user.getAddress())
                    .setParameter("creditLimit", user.getCreditLimit())
                    .setParameter("email", user.getEmail())
                    .setMaxResults(1);
            int updatedRows = query.executeUpdate();
            return updatedRows > 0;
        });
    }


    @Override
    public boolean updatePasswordUser(User user) {
        if (user == null) {
            System.err.println("User is null.");
            return false;
        }

        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<User>> violations = validator.validate(user);
        if (!violations.isEmpty()) {
            System.out.println("Validation failed:");
            for (ConstraintViolation<User> violation : violations) {
                System.out.println(violation.getPropertyPath() + " " + violation.getMessage());
            }
            return false;
        }
        return Database.doInTransaction(entityManager -> {
            Query query = entityManager.createQuery("UPDATE User u SET u.password=:password WHERE u.id=:userId")
                    .setParameter("password", user.getPassword())
                    .setParameter("userId", user.getId())
                    .setMaxResults(1);
            int updatedRows = query.executeUpdate();
            return updatedRows > 0;
        });
    }
}
