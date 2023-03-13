package com.posh.network;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityFactory {
    private static EntityFactory instance;
    private EntityManagerFactory entityManagerFactory;
    public EntityFactory(String presistanceUnitName) {
        entityManagerFactory = Persistence.createEntityManagerFactory(presistanceUnitName);
    }

    public static EntityFactory getInstance(String presistanceUnitName) {
        if (instance == null)
                instance = new EntityFactory(presistanceUnitName);
        return instance;
    }

    public EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }
}
