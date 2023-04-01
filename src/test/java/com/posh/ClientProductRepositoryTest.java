package com.posh;

import com.posh.dtos.productdtos.FullProductDto;
import com.posh.dtos.productdtos.HomeProduct;
import com.posh.extension.DatabaseTest;
import com.posh.model.Category;
import com.posh.model.Image;
import com.posh.model.Product;
import com.posh.persistance.Database;
import com.posh.persistance.repository.implementations.UserProductRepository;
import com.posh.service.ClientProductService;
import com.posh.utils.ObjectsToJsonConverter;
import com.posh.dtos.FilterRecord;
import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.provider.Arguments;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;
public class ClientProductRepositoryTest {
    private static UserProductRepository userProductRepository;
    private static ClientProductService service;

    @BeforeAll
    static void initialize() {
        userProductRepository = new UserProductRepository();
        service = ClientProductService.getInstance();
    }

//    @ParameterizedTest
//    @MethodSource("categoryProvider")
//    public void GivenCategoryNumber_WhenCategoryEntered_ThenDisplayAllItsProduct(int categoryNumber){
//        //Act
//
//        List<HomeProduct> products = userProductRepository.getProductByCategory(categoryNumber,1,em);
//        System.out.println(ObjectsToJsonConverter.ListToJson(Collections.singletonList(products)));
//        //assert
//        SoftAssertions softAssertions = new SoftAssertions();
//        products.forEach((product) -> {
//            softAssertions.assertThat(product.getCategory().getId()).isEqualTo(categoryNumber);
//        });
//        softAssertions.assertAll();
//    }
//
//    @Test
//    public void GivenPrice_whenFilterProductByPrice_ThenGetAllProductInThatRange() {
//        //arrange
//        int startRange = 100;
//        int endRange = 500;
//        //Act
//        List<FullProduct> products = userProductRepository.getProductByPrice( startRange, endRange );
//        System.out.println(ObjectsToJsonConverter.ListToJson(Collections.singletonList(products)));
//        //assert
//        SoftAssertions softAssertions = new SoftAssertions();
//        products.forEach((product) -> {
//            softAssertions.assertThat(product.getPrice().intValue()).isBetween( startRange, endRange );
//        });
//        softAssertions.assertAll();
//    }
//
//    @Test
//    public void GivenVendorName_WhenProductBelongsToThatVendor_ThenGetIt() {
//        //arrange
//        String vendorName = "MXC";
//        //Act
//        List<FullProduct> products = userProductRepository.getProductByVendor( vendorName );
//        System.out.println(ObjectsToJsonConverter.ListToJson(Collections.singletonList(products)));
//        //assert
//        SoftAssertions softAssertions = new SoftAssertions();
//        products.forEach((product) -> {
//            softAssertions.assertThat(product.getVendor().toLowerCase()).isEqualTo( vendorName.toLowerCase() );
//        });
//        softAssertions.assertAll();
//    }
//
//    @Test
//    public void GivenNameOfProduct_WhenProductContainsSearchValue_thenReturnListOfThatProduct(){
//        //arrange
//        String searchValue = "oilq";
//        //act
//        List<HomeProduct> products = userProductRepository.searchForProduct(searchValue);
//        System.out.println(ObjectsToJsonConverter.ListToJson(Collections.singletonList(products)));
//        //assert
//        SoftAssertions softAssertions = new SoftAssertions();
//        products.forEach((product) -> {
//            softAssertions.assertThat( product.getName() ).contains( searchValue );
//        });
//        softAssertions.assertAll();
//    }
//

    @Test
    public void insert_product_toDatabase() {
        //Arrange
        List<Product> products = new ArrayList<>();
        List<Image> images = new ArrayList<>();
        images.add(new Image("h.jpeg"));
        images.add(new Image("h.jpeg"));
        images.add(new Image("h.jpeg"));

        List<Image> images2 = new ArrayList<>();
        images2.add(new Image("o.jpeg"));
        images2.add(new Image("o.jpeg"));
        images2.add(new Image("o.jpeg"));

        Category category = new Category("OIL");
        Database.doInTransactionWithoutResult(em -> em.persist(category));
        Category res = Database.doInTransaction(em -> em.find(Category.class,1));
        products.add(new Product(res, "oil", "oil is oi", "asf3", new BigDecimal("555"), 55,"hhjh", "gy", "egy", images2));
        products.add(new Product(res, "oil", "oil is oi", "asf4", new BigDecimal("555"), 55,"hhjh", "gy", "egy", images));

        //ACT
        Database.doInTransactionWithoutResult(em ->{
            em.persist(products.get(0));
            em.persist(products.get(1));
        });

        //ASSERT
        List<Product> result = Database.doInTransaction(em -> em.createQuery("FROM Product p").getResultList());
        Assertions.assertEquals(result.size(), products.size());
    }
    @Test
    public void GivenProductId_WhenProductIsFound_ThenReturnThisProduct() {
        //arrange
        int id = 1;
        //Act
        FullProductDto product = service.findProductByID( id );
        System.out.println(ObjectsToJsonConverter.ObjectsToJsonConverter(product));
        //assert
        Assertions.assertEquals( product.getProductId(), id );
    }

    @Test
    public void GivenCategoriesAndStartPriceAndEndPriceAndPageNumberAndSearchName_WhenCategoryIsBatteryAndOil_thenReturnOnlyTwoCategoriesWithThatFilter(){
        //arrange
        FilterRecord searchValue = new FilterRecord(new int[]{1},new BigDecimal(String.valueOf(0)),new BigDecimal(String.valueOf(10000)),1,"");
        //act
        List<HomeProduct> products = service.FilterProduct(searchValue);
        System.out.println(ObjectsToJsonConverter.ListToJson(Collections.singletonList(products)));
        //assert
        SoftAssertions softAssertions = new SoftAssertions();
        products.forEach((product) -> {
            softAssertions.assertThat( product.getPrice() ).isBetween( searchValue.startPrice(), searchValue.EndPrice() );
            softAssertions.assertThat(product.getCategory()).isIn(1, 2, 3);

        });
        softAssertions.assertAll();
    }
    public static Stream<Arguments> categoryProvider() {
        return Stream.of(
                Arguments.of( 1),
                Arguments.of( 2),
                Arguments.of( 3),
                Arguments.of( 4),
                Arguments.of( 5)
        );
    }
@Test
    public void getPopularProducts() {
        //Arrange
        //Act
    List<HomeProduct> popularProducts = ClientProductService.getInstance().findPopularProducts();
    popularProducts.forEach(homeProduct -> System.out.println(homeProduct.getName() + " , " + homeProduct.getProductId()));
    Assertions.assertTrue(popularProducts.size() == 2);
}

@Test
    public void safsaf(){
    List<Image> images = new ArrayList<>();
    images.add(new Image("h.jpeg"));
    images.add(new Image("h.jpeg"));
    images.add(new Image("h.jpeg"));

    Product product = new Product(new Category(1), "oil", "oil is oi", "gsaff4", new BigDecimal("555"), 55, "hhjh", "gy", "egy", images);
    Database.doInTransactionWithoutResult(em -> em.persist(product));
    }

}
