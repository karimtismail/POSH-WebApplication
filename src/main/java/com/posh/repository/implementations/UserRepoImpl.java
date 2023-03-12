package com.posh.repository.implementations;

import com.posh.model.UsersEntity;
import com.posh.repository.interfaces.UserRepo;
import com.posh.utils.EntityManagerFactoryUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

public class UserRepoImpl implements UserRepo {
    private static UserRepo userRepo = null;

    private UserRepoImpl() {
    }

    public static UserRepo getUserRepo() {
        if (userRepo == null) {
            userRepo = new UserRepoImpl();
        }
        return userRepo;
    }

    @Override
    public void createUser(UsersEntity user) {
        EntityManager entityManager = EntityManagerFactoryUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();
//        entityManager.close();
    }

    @Override
    public boolean checkIfEmailExists(String email) {
        if (email == null) {
            throw new IllegalArgumentException("Email cannot be null!!");
        }
        try {
            EntityManager entityManager = EntityManagerFactoryUtil.getEntityManagerFactory().createEntityManager();
            Query query = entityManager.createQuery("SELECT count(UsersEntity.email) FROM UsersEntity WHERE UsersEntity.email = :email");
            query.setParameter("email", email);
            long result = (Long) query.getSingleResult();
//            entityManager.close();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
