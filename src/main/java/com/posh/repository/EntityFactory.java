package com.posh.repository;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class EntityFactory {
    private static EntityManagerFactory entityManagerFactory = null;
    public static EntityManagerFactory getEntityManagerFactory() {
        if(entityManagerFactory==null)
            entityManagerFactory = Persistence.createEntityManagerFactory("posh");
        return  entityManagerFactory;
    }




}
