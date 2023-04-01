<%@taglib prefix="c" uri="jakarta.tags.core" %>
    <jsp:useBean id="ProductBean" type="com.posh.dtos.productdtos.ProductBean"
        scope="request"/>
        <c:forEach var="product" items="${ProductBean.products}">
            <div class="col-sp col-6 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                <label hidden>${product.productId}</label>
                <div class="product-item">
                    <div class="product-image-action">
                        <div class="product-image">
                            <a
                                href="productDetails?product_id=${product.productId}">
                                <img class="img-fluid blur-up lazyload"
                                    src="resource?image=${product.image}"
                                    data-src="resource?image=${product.image}"
                                    alt="image"
                                    title="image"
                                    style="height: 240px; object-fit: fill"
                                    /></a>
                        </div>
                        <div class="product-details">
                            <h3 class="product-title"><a
                                    href="productDetails?product_id=${product.productId}">${product.name}</a></h3>
                            <h4 class="product-vendor">${product.vendor}</h4>
                            <div
                                class="product-starrating">
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star-o"></i>
                            </div>
                            <div class="product-price">
                                <span class="sale-price">$ ${product.price}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>