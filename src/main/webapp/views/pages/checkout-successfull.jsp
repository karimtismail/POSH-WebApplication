<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <jsp:useBean id="sCheckoutResponse"
            type="com.posh.dtos.orderdtos.CheckoutResponse"
            scope="request" />
            <!DOCTYPE html>
            <html class="no-js" lang="en">
                <head>
                    <!-- Required meta tags -->
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width,
                        initial-scale=1" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="description" content=" " />
                    <!-- Title -->
                    <title>Checkout Success - Posh Auto Parts eCommerce
                        Bootstrap 4 Html Template</title>
                    <!-- Favicon  -->
                    <link rel="shortcut icon" href="views/images/fevicon.png" />
                    <!-- *********** CSS Files *********** -->
                    <!-- Plugin CSS -->
                    <link rel="stylesheet" href="views/style/plugins.css" />
                    <!-- Styles CSS -->
                    <link rel="stylesheet" href="views/style/styles.css" />
                    <link rel="stylesheet" href="views/style/responsive.css" />
                </head>

                <body class="template-checkout-success">
                    <!-- Start Page Loader -->
                    <div class="page-loading"></div>
                    <!-- End Page Loader -->

                    <!--  Start Main Wrapper -->
                    <div class="main-wrapper cart-drawer-push">
                        <!-- Start Main Content -->
                        <main class="main-content">
                            <!-- Start Checkout Success -->
                            <div class="checkout-success-content">
                                <div class="container">

                                    <div class="row row-sp">
                                        <div class="col-sp col-12 col-sm-12
                                            col-md-12 col-lg-6">
                                            <div class="card border-0
                                                rounded-0">
                                                <div class="card-body">
                                                    <p
                                                        class="checkout-success-icon"><i
                                                            class="fa
                                                            fa-check-square-o"></i></p>
                                                    <h4 class="card-title">Thank
                                                        you for your purchase!</h4>
                                                    <p class="card-text mb-1">Your
                                                        order # is: <b>${sCheckoutResponse.orderId}</b>.</p>
                                                    <p class="card-text mb-1">You
                                                        will receive an order
                                                        confirmation email with
                                                        details of your order
                                                        and a link to track its
                                                        progress.</p>
                                                    <p class="card-text mb-1">All
                                                        necessary information
                                                        about the delivery, we
                                                        sent to your email</p>
                                                    <a href="products"
                                                        class="btn btn-primary
                                                        mt-4">Continue Shopping</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sp col-12 col-sm-12
                                            col-md-12 col-lg-6">
                                            <div class="checkout-item-ordered">
                                                <h2>Item Ordered</h2>
                                                <div class="table-content
                                                    table-responsive
                                                    checkout-review mb-4">
                                                    <table class="table
                                                        table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th
                                                                    class="text-center"></th>
                                                                <th
                                                                    class="text-left">Product
                                                                    Name</th>
                                                                <th
                                                                    class="text-center">Qty</th>
                                                                <th
                                                                    class="text-center">Price</th>
                                                                <th
                                                                    class="text-center">Subtotal</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach
                                                                var="prod"
                                                                items="${sCheckoutResponse.products}">
                                                                <tr>
                                                                    <td
                                                                        class="pro-img
                                                                        text-center"><img
                                                                            class="img-fluid
                                                                            blur-up
                                                                            lazyload"
                                                                            src="resource?image=${prod.image}"
                                                                            data-src="resource?image=${prod.image}"
                                                                            alt="image"
                                                                            title="image"
                                                                            width="100"></td>
                                                                    <td
                                                                        class="pro-name
                                                                        text-center
                                                                        text-sm-left"><p
                                                                            class="mb-1"><a
                                                                                href="product-details.html">${prod.name}</a></p></td>
                                                                    <td
                                                                        class="pro-price
                                                                        text-center">${prod.quantity}</td>
                                                                    <td
                                                                        class="pro-price
                                                                        text-center">${prod.price}
                                                                        $</td>
                                                                    <td
                                                                        class="pro-total
                                                                        text-center">${prod.price
                                                                        *
                                                                        prod.quantity}
                                                                        $</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                        <tfoot
                                                            class="text-right">
                                                            <tr>
                                                                <td colspan="4"
                                                                    class="item
                                                                    subtotal">Subtotal:</td>
                                                                <td
                                                                    class="last">${sCheckoutResponse.totalPrice}</td>
                                                            </tr>

                                                            <tr>
                                                                <td colspan="4"
                                                                    class="item
                                                                    shipping">Shipping:</td>
                                                                <td
                                                                    class="last">${sCheckoutResponse.products.size()
                                                                    * 2} $</td>
                                                            </tr>

                                                        </tfoot>
                                                    </table>
                                                </div>

                                                <div class="ship-info-details
                                                    shipping-method-details">
                                                    <div class="row">
                                                        <div class="col-12
                                                            col-sm-6 col-md-6
                                                            col-lg-6">
                                                            <div
                                                                class="shipping-details
                                                                mb-4 mb-sm-0
                                                                clearfix">
                                                                <h3>Shipping
                                                                    Address</h3>
                                                                <p>${sCheckoutResponse.address},</p>
                                                                <p>${sCheckoutResponse.city},</p>
                                                                <p>EGY</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-12
                                                            col-sm-6 col-md-6
                                                            col-lg-6">
                                                            <div
                                                                class="billing-details
                                                                clearfix">
                                                                <h3>Shipping
                                                                    Method</h3>
                                                                <p>Flat Rate -
                                                                    Fixed</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="ship-info-details
                                                    billing-payment-details">
                                                    <div class="row">
                                                        <div class="col-12
                                                            col-sm-6 col-md-6
                                                            col-lg-6">
                                                            <div
                                                                class="shipping-details
                                                                mb-4 mb-sm-0
                                                                clearfix">
                                                                <h3>Billing
                                                                    Address</h3>
                                                                <p>${sCheckoutResponse.address},</p>
                                                                <p>${sCheckoutResponse.city},</p>
                                                                <p>EGY</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-12
                                                            col-sm-6 col-md-6
                                                            col-lg-6">
                                                            <div
                                                                class="billing-details
                                                                clearfix">
                                                                <h3>Payment
                                                                    Method</h3>
                                                                <p>cash on
                                                                    deliver</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="delivery-date"><strong>Delivery
                                                        Date:</strong> N/A</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Checkout Success -->
                        </main>
                        <!-- End Main Content -->

                        <!-- Start Scroll Top -->
                        <div id="scrollTop"><i class="ti-arrow-up"></i></div>
                        <!-- End Scroll Top -->

                        <!-- Overlay -->
                        <div class="overlay"></div>

                    </div>
                    <!--  End Main Wrapper -->

                    <!-- ******** JS Files ******** -->
                    <!-- Plugin JS -->
                    <script src="views/js/plugins.js"></script>

                    <!-- Main JS -->
                    <script src="views/js/main.js"></script>

                </body>
            </html>