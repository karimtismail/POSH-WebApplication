<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="ProductBean" type="com.posh.dtos.productdtos.ProductBean"
        scope="request"/>
        <ul class="d-flex
            flex-column
            color-item">
            <c:forEach var="product" items="${ProductBean.products}">
                <li>
                    <div
                        class="pop-img
                        pull-left
                        mr-3"><a
                            href="productDetails?product_id=${product.productId}"><img
                                class="img-fluid
                                blur-up
                                lazyload"
                                src="resource?image=${product.image}"
                                data-src="resource?image=${product.image}"
                                alt="image"
                                title="image"
                                /></a></div>
                    <div
                        class="pop-dec
                        pull-left">
                        <a
                            class="d-block"
                            href="productDetails?product_id=${product.productId}">${product.name}</a>
                        <span
                            class="d-block
                            product-price">${product.price}$$</span>
                    </div>
                </li>
            </c:forEach>
        </ul>