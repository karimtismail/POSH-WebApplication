package com.posh.controller.listeners;


import com.posh.persistance.Database;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener  {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialize entity manager factory
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Database.close();
    }
    
}
