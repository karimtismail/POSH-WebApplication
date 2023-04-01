<%@taglib prefix="c" uri="jakarta.tags.core" %>
    <jsp:useBean id="cartResponse"
        type="com.posh.dtos.cartdtos.CartProductsResponse"
        scope="session" />
            <div class="minicart-head">
                <h3>Shopping Cart</h3>
                <a class="close-btn active">
                    <i class="ti-close"></i>
                </a>
            </div>
            <div class="minicart-details">
                <div class="empty-cart">
                    <p>You have no items in your shopping cart.</p>
                </div>
                <ul class="cart-lists clearfix">
                    <c:forEach var="product" items="${cartResponse.productDtos}">
                        <li id = "cart${product.id}" class="cart-item d-table">
                            <div class="pro-img d-table-cell align-middle">
                                <a href="productDetails?product_id=${product.id}">
                                    <img class="img-fluid blur-up lazyload"
                                        src="resource?image=${product.image}"
                                        data-src="resource?image=${product.image}"
                                        alt="image" title="Donec pede justo
                                        fringilla" />
                                </a>
                            </div>
                            <div class="item-info pl-4 text-left d-table-cell
                                align-top">
                                <a href="productDetails?product_id=${product.id}">${product.name}</a>
                                <p class="price">${product.quantity} x $ ${product.price}</p>
                            </div>
                            <div class="item-right cart-remove d-table-cell
                                align-middle">
                                <a class="edit mr-2" href="productDetails?product_id=${product.id}"><i
                                        class="ti-pencil-alt"></i></a>
                                <a onclick="removeFromCart('${product.id}', '${product.price * product.quantity}')" class="remove" href="#"><i class="ti-close"></i></a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="minicart-bottom-actions">
                <div class="pro-totals d-inline-block w-100">
                    <div class="items mb-1 clearfix">
                        <span class="item subtotal float-left">Subtotal:</span>
                        <span id = "cartsubTotalPrice" class="price-total float-right"><span
                                class="price">$ ${cartResponse.totalAmount}</span></span>
                    </div>
                    <div class="items mb-1 clearfix">
                        <span class="item shipping float-left">Shipping:</span>
                        <span  class="price-total float-right"><span
                                class="price">$ ${cartResponse.shippingPrice}</span></span>
                    </div>

                    <div class="items clearfix">
                        <span class="item total float-left">Total:</span>
                        <span id = "cartsubTotalPrice" class="price-total float-right"><span
                                class="price">$ ${cartResponse.totalAmount +
                                cartResponse.shippingPrice}</span></span>
                    </div>
                </div>
                <div class="actions d-inline-block w-100 text-center">
                    <a class="btn btn-secondary d-block font-sm-14" href="checkoutCartProducts">Proceed
                        to checkout</a>
                </div>
            </div>
