
import com.posh.model.ProductsEntity;
import jakarta.persistence.*;

public class Main {
    public static void main(String args[]) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("posh");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        ProductsEntity c = new ProductsEntity();
        entityManager.getTransaction().begin();
        entityManager.persist(c);
        entityManager.getTransaction().commit();

    }
}
