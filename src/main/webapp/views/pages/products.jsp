<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html class="no-js" lang="en">
            <head>
                <!-- Required meta tags -->
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width,
                    initial-scale=1"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="description" content=" "/>
                <!-- Title -->
                <title>Posh - Auto Parts eCommerce Bootstrap 4 Html Template</title>
                <!-- Favicon  -->
                <link rel="shortcut icon" href="views/images/fevicon.png"/>

                <!-- *********** CSS Files *********** -->
                <!-- Plugin CSS -->
                <link rel="stylesheet" href="views/style/plugins.css"/>
                <!-- Styles CSS -->
                <link rel="stylesheet" href="views/style/styles.css"/>
                <link rel="stylesheet" href="views/style/responsive.css"/>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <script src=http://code.jquery.com/jquery-latest.min.js></script>
            </head>

            <body onload="loadProducts('ALL');"
                class="template-product-grid-leftsidebar">

                <!-- Start Page Loader -->
                <div class="page-loading"></div>
                <!-- End Page Loader -->

                <!--  Start Main Wrapper -->
                <div class="main-wrapper cart-drawer-push">

                    <%@include file="includes/header.jsp" %>

                        <!--  Start Main Wrapper -->
                        <div class="main-wrapper cart-drawer-push">
                            <!-- Start Main Content -->
                            <main class="main-content">
                                <!-- Start Breadcrumb -->
                                <div class="breadcrumbs text-center">
                                    <div class="container">
                                        <h1>Shop Grid Left Sidebar</h1>
                                        <ul class="breadcrumb bg-transparent m-0
                                            p-0 justify-content-center">
                                            <li class="breadcrumb-item"><a
                                                    href="index.html"
                                                    title="Home">Home</a></li>
                                            <li class="breadcrumb-item active">Shop
                                                Grid Left Sidebar</li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Breadcrumb -->

                                <!-- Start Product with Filter -->
                                <div class="product-filter-sidebar">
                                    <div class="container">
                                        <div class="row">
                                            <!-- Start Product Filter -->
                                            <div class="col-12 col-sm-12
                                                col-lg-3 sidebar sidebar-left">
                                                <!-- Start Shop By -->
                                                <div class="filter-block">
                                                    <h3 class="block-title
                                                        shopby">SHOP BY</h3>
                                                    <div class="block-content">
                                                        <!-- Start Categories -->
                                                        <div class="block-item
                                                            categories">
                                                            <h4
                                                                class="sub-title">Categories</h4>
                                                            <ul
                                                                class="block-details
                                                                list
                                                                sidebar-collections">
                                                                <li><a name=""
                                                                        onclick="loadProducts('OIL');">Oil</a></li>
                                                                <li><a name=""
                                                                        onclick="loadProducts('LIQUID');">Liquid</a></li>
                                                                <li><a name=""
                                                                        onclick="loadProducts('BATTERY');">Batteries</a></li>
                                                                <li><a name=""
                                                                        onclick="loadProducts('PLUG');">plugs</a></li>
                                                                <li><a name=""
                                                                        onclick="loadProducts('TIER');">Tiers</a></li>
                                                                <li><a name=""
                                                                        onclick="loadProducts('ALL');">All</a></li>
                                                            </ul>
                                                        </div>
                                                        <!-- End Categories -->
                                                        <!-- Start Price -->
                                                        <div class="block-item
                                                            price">
                                                            <h4
                                                                class="sub-title">Price</h4>
                                                            <div
                                                                class="block-details">
                                                                <div
                                                                    class="rangeslider">
                                                                    <div
                                                                        id="sliderRange"
                                                                        class="slider-range"></div>
                                                                </div>
                                                                <div
                                                                    class="form-group
                                                                    m-0 d-flex
                                                                    justify-content-between
                                                                    align-items-center">
                                                                    <label
                                                                        id="price_result"
                                                                        class="range-number
                                                                        m-0
                                                                        pull-left"></label>
                                                                    <button
                                                                        onclick="filterByPrice();"
                                                                        type="button"
                                                                        class="btn
                                                                        btn-primary
                                                                        pull-right
                                                                        find-btn">Find
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End Price -->
                                                    </div>
                                                    <!-- Start Popular Products -->
                                                    <div class="cms-block
                                                        popular-products">
                                                        <h4 class="sub-title">Popular
                                                            Products</h4>
                                                        <div id = "popular_products"
                                                            class="cms-block-content">

                                                        </div>
                                                    </div>
                                                    <!-- End Popular Products -->
                                                </div>
                                                <!-- End Shop By -->
                                            </div>
                                            <!-- End Product Filter -->

                                            <!-- Start Products -->
                                            <div class="product-view-items
                                                product-grid col-12 col-sm-12
                                                col-lg-9 sidebar-right">
                                                <!-- Start Collection Banner Image -->
                                                <div
                                                    class="collection-banner-img">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <img
                                                                class="img-fluid
                                                                blur-up
                                                                lazyload"
                                                                src="views/images/collection/banner1.jpeg"
                                                                data-src="views/images/collection/banner1.jpeg"
                                                                alt="image"
                                                                style="width:
                                                                100%;"
                                                                title="image"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Collection Banner Image -->
                                                <!-- Start Filters Tollbar -->
                                                <div class="filters-toolbar">
                                                    <div class="row row-sp
                                                        align-items-center">
                                                        <div class="col-sp col-4
                                                            col-sm-4 text-left
                                                            order-1 order-sm-0">
                                                            <div
                                                                class="filters-item">
                                                                <a
                                                                    href="shop-grid-left-sidebar.html"
                                                                    title="Grid"
                                                                    class="btn
                                                                    active"
                                                                    data-view="grid"><i
                                                                        class="ti-view-grid"></i></a>
                                                            </div>
                                                        </div>
                                                        <div class="col-sp
                                                            col-12 col-sm-4
                                                            text-center mb-4
                                                            mb-sm-0 order-0
                                                            order-sm-1">
                                                            <p class="m-0">Showing
                                                                1-16 of 21
                                                                results</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- End Filters Tollbar -->
                                                <!-- Start Products Grid -->
                                                <div class="products
                                                    products-grid">
                                                    <div id="product_list"
                                                        class="row row-sp
                                                        row-eq-height">

                                                    </div>

                                                    <!-- Start Load More Button -->
                                                    <div class="product-readmore
                                                        text-center">
                                                        <button
                                                            onclick="loadMoreProducts();"
                                                            type="button"
                                                            class="btn
                                                            btn-secondary">Load
                                                            More
                                                        </button>
                                                    </div>
                                                    <!-- End Load More Button -->
                                                </div>
                                                <!-- End Products Grid -->
                                            </div>
                                            <!-- End Products -->
                                        </div>
                                    </div>
                                </div>
                                <!-- End Product with Filter -->
                            </main>
                            <!-- End Main Content -->

                            <!-- Start Scroll Top -->
                            <div id="scrollTop"><i class="ti-arrow-up"></i></div>
                            <!-- End Scroll Top -->

                            <!-- Start Cart Drawer -->
                            <div class="minicart-wrapper">
                                <div id="cart_view" class="cart-drawer model
                                    fade right show cart-drawer-right">

                                </div>
                            </div>
                            <!-- End Cart Drawer -->

                            <!-- Start Product Cart Added Popup -->
                            <div id="open-addtocart-popup"
                                class="addtocart-popup magnific-popup mfp-hide">
                                <div class="addtocart-inner-content
                                    text-center">
                                    <h4>Added to Cart Successfully</h4>
                                    <p class="pro-img"><img class="img-fluid
                                            blur-up lazyload"
                                            src="views/images/products/addtocart-popup.jpg"
                                            data-src="views/images/products/addtocart-popup.jpg"
                                            alt="image" title="image"/>
                                    </p>
                                    <p class="modal-prod-name mb-1 font-15">Carb
                                        Fits Cigarette tiyer</p>
                                    <p class="mb-1 font-13">Color: Black</p>
                                    <p class="font-13">Quantity: 1</p>
                                    <div class="addcart-total">
                                        There are <b>1</b> items in your cart
                                        <div class="cart-total mt-2">
                                            Total: <b class="price">$113.88</b>
                                        </div>
                                    </div>
                                    <div class="button-action">
                                        <button class="btn btn-secondary
                                            btn-block mb-3 continue-shopping
                                            close-popup">Continue Shopping
                                        </button>
                                        <a href="cart.html" class="btn
                                            btn-primary btn-block view-cart">View
                                            Cart</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Product Cart Added Popup -->
                            <!-- Start Search Drawer -->
                            <div class="search-area modal fade top"
                                id="searchform" tabindex="-1" role="dialog"
                                aria-hidden="true"
                                data-backdrop="true">
                                <div class="modal-dialog modal-frame modal-top
                                    modal-notify modal-info" role="document">
                                    <div class="container">
                                        <div class="modal-content search-inline
                                            align-content-center">
                                            <div class="search-head
                                                position-relative">
                                                <h3>What are you looking for?</h3>
                                                <a class="search-close"
                                                    data-dismiss="modal"
                                                    aria-label="Close">
                                                    <i class="ti-close"
                                                        aria-hidden="true"></i>
                                                </a>
                                            </div>
                                            <form action="#"
                                                class="position-relative">
                                                <input type="text"
                                                    class="form-control"
                                                    placeholder="Search
                                                    Products..."/>
                                                <button class="search-btn"
                                                    type="submit">
                                                    <i class="ti-search"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Search Drawer -->

                            <!-- Overlay -->
                            <div class="overlay"></div>

                        </div>
                    </div>

                    <!--  End Main Wrapper -->

                    <%@include file="includes/footer.jsp" %>

                        <!-- ******** JS Files ******** -->
                        <!-- Plugin JS -->
                        <script src="views/js/plugins.js"></script>

                        <!-- Main JS -->
                        <script src="views/js/main.js"></script>

                        <script src="views/js/product.js"></script>

                        <script src="views/js/cart.js"></script>

                    </body>
                </html>