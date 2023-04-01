package com.posh.extension;

import com.posh.persistance.Database;
import jakarta.persistence.Query;
import org.junit.jupiter.api.extension.BeforeEachCallback;
import org.junit.jupiter.api.extension.ExtensionContext;

import java.util.List;

public class DatabaseCleanupExtension implements BeforeEachCallback {

    public static final List<String> DELETE_STATEMENTS =
            List.of("DELETE FROM cartitems;");

    @Override
    public void beforeEach(ExtensionContext context) throws Exception {
        clearDatabase();
    }

    private static void clearDatabase() {
        Database.doInTransactionWithoutResult(
                em -> DELETE_STATEMENTS.stream()
                                       .map(em::createNativeQuery)
                                       .forEach(Query::executeUpdate)
        );
    }
}
