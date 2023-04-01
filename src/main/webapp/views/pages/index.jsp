<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
    <script src="https://code.jquery.com/jquery-3.6.3.slim.js"
            integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
</head>

<body class="template-index">
<!-- Start Page Loader -->
<div class="page-loading"></div>
<!-- End Page Loader -->

<!--  Start com.posh.App.Main Wrapper -->
<div class="main-wrapper cart-drawer-push">
    <!-- Start Promotional Bar Section -->
    <div class="promotional-bar border-0 rounded-0 d-flex align-items-center alert alert-warning fade show"
         role="alert">
        <div class="container-fluid full-promotional-bar">
            <span>Shop with discount 50%. Hurry Up! <a href="#">Shop Now</a></span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><i class="ti-close"></i>
            </button>
        </div>
    </div>
    <!-- End Promotional Bar Section -->
    <%@include file="includes/header.jsp" %>

    <!-- Start com.posh.App.Main Content -->
    <main class="main-content">
        <!-- Start Banner Slidershow Section -->
        <div class="ymm-slideshow position-relative sections-spacing">

            <!-- Start Slidershow Banner -->
            <div class="slideshow slideshow-banner">
                <div class="single-slide slider-height bg-style d-flex align-items-center"
                     style="background-image:url(views/images/slider/slider1.jpg);">
                    <div class="container slideshow-details">
                        <h3>Faster & Secure Find Your Auto Parts</h3>
                        <p>High Performance & Outstanding Technology Combined</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Buy now!</a>
                    </div>
                </div>
                <div class="single-slide slider-height bg-style d-flex align-items-center"
                     style="background-image:url(views/images/slider/batteries.jpg);">
                    <div class="container slideshow-details">
                        <h3>Shop Parts With Confidence</h3>
                        <p>Always The Lowest Price. Guaranteed.</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Buy now!</a>
                    </div>
                </div>
                <div class="single-slide slider-height bg-style d-flex align-items-center"
                     style="background-image:url(views/images/slider/tire.jpg);">
                    <div class="container slideshow-details">
                        <h3>The Automotive Interior Specialist</h3>
                        <p>Luxury Car Seat Covers Protect Your Seats</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Buy now!</a>
                    </div>
                </div>
            </div>
            <!-- End Slidershow Banner -->
        </div>
        <!-- End Banner Slidershow Section -->

        <!-- Start Four Banner Section -->
        <div class="home-four-banner sections-spacing">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-6 banner-1">
                        <div class="small-banner-1 position-relative">
                            <a class="animate-scale" href="${pageContext.request.contextPath}/products"><img
                                    class="img-fluid blur-up lazyload w-100" src="views/images/banner/tires.jpg"
                                    data-src="views/images/banner/tires.jpg" alt="image" title="image" height="448"
                                    width="570"/></a>
                            <div class="banner-details">
                                <h3>Wheel <span>Expert</span></h3>
                                <p>Check out our loving products today</p>
                                <a href="${pageContext.request.contextPath}/products" class="btn btn-success">Buy
                                    now!</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-12 col-md-6 banner-23">
                        <div class="row mb-5">
                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="small-banner-2 position-relative">
                                    <a class="animate-scale" href="${pageContext.request.contextPath}/products">
                                        <img class="img-fluid blur-up lazyload w-100"
                                             src="views/images/banner/plugs.jpg"
                                             data-src="views/images/banner/plugs.jpg" alt="image"
                                             title="image"
                                             height="210" width="270"/>
                                        <div class="banner-details">
                                            <h3 style="color: white">Plugs</h3>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6">
                                <div class="small-banner-3 position-relative">
                                    <a class="animate-scale" href="${pageContext.request.contextPath}/products">
                                        <img class="img-fluid blur-up lazyload w-100"
                                             src="views/images/banner/engineliquid.jpg"
                                             data-src="views/images/banner/engineliquid.jpg" alt="image"
                                             title="image"
                                             height="210"
                                             width="270"/>
                                        <div class="banner-details">
                                            <h3 style="color: white">Engine</h3>
                                            <p style="color: white">Liquid</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 col-sm-12">
                                <div class="small-banner-4 position-relative">
                                    <a class="animate-scale" href="${pageContext.request.contextPath}/products">
                                        <img class="img-fluid blur-up lazyload w-100"
                                             src="views/images/banner/battries.jpg"
                                             data-src="views/images/banner/battries.jpg" alt="image"
                                             title="image"
                                             height="208"
                                             width="570"/>
                                        <div class="banner-details">
                                            <h3>Batteries</h3>
                                            <p>Cars</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Four Banner Section -->

        <!-- Start Video Information Section -->
        <div class="video-information sections-spacing">
            <div class="container">
                <div class="row d-sm-flex flex-sm-row align-items-sm-center">
                    <!-- Start Video Image -->
                    <div class="col-12 col-sm-12 col-md-6 video-image">
                        <div id="play-youtube-video" class="position-relative d-block">
                            <img class="img-fluid blur-up lazyload w-100"
                                 style="width: 570px; height: 510px; object-fit: fill;"
                                 src="views/images/others/whatWeOffer.jpg"
                                 data-src="views/images/others/whatWeOffer.jpg" alt="image" title="image"/>

                            <a href="#open-video-popup" class="vid-icon open-video-popup"><i
                                    class="ti-control-play"></i></a>
                        </div>
                        <div id="open-video-popup" class="youtube-video-popup magnific-popup mfp-hide">
                            <div class="embed-responsive embed-responsive-16by9">
                                <!-- <iframe class="mfp-iframe embed-responsive-item" src="views/images/others/Manny's Auto Repair Commercial_AD.mp4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen>></iframe> -->
                                <video class="mfp-iframe embed-responsive-item" controls preload="auto">
                                    <source src="views/images/others/Manny's Auto Repair Commercial_AD.mp4"
                                            type="video/mp4">
                                </video>
                            </div>
                        </div>
                    </div>
                    <!-- End Video Image -->

                    <!-- Start Video Info -->
                    <div class="col-12 col-sm-12 col-md-6 video-info">
                        <div class="section-header">
                            <h2>What We Offers</h2>
                            <p>Wide selection of Auto parts professional choice</p>
                        </div>
                        <div class="row storeFeatures">
                            <div class="col-12 col-sm-6 col-md-6 feature-item text-center">
                                <img class="img-fluid blur-up lazyload" src="views/images/icons/appointment.jpg"
                                     data-src="views/images/icons/appointment.jpg" alt="image" title="image"/>
                                <h5>Online Appointment</h5>
                                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed eiusmod tempor
                                        incididu et dolore.</span>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 feature-item text-center">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/icons/services-prices.jpg"
                                     data-src="views/images/icons/services-prices.jpg" alt="image" title="image"/>
                                <h5>Best Services Prices</h5>
                                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed eiusmod tempor
                                        incididu et dolore.</span>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 feature-item text-center">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/icons/wheel-balancing.jpg"
                                     data-src="views/images/icons/wheel-balancing.jpg" alt="image" title="image"/>
                                <h5>The Wheel Balancing</h5>
                                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed eiusmod tempor
                                        incididu et dolore.</span>
                            </div>
                            <div class="col-12 col-sm-6 col-md-6 feature-item text-center">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/icons/carzone-painting.jpg"
                                     data-src="views/images/icons/carzone-painting.jpg" alt="image" title="image"/>
                                <h5>Carzone Painting</h5>
                                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit sed eiusmod tempor
                                        incididu et dolore.</span>
                            </div>
                        </div>
                    </div>
                    <!-- End Video Info -->
                </div>
            </div>
        </div>
        <!-- End Video Information Section -->

        <!-- Start Information Section -->
        <div class="information sections-spacing">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                        <div class="info-area d-flex flex-row align-items-center">
                            <div class="info-icon">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/icons/free-shipping-small.png"
                                     data-src="views/images/icons/free-shipping-small.png" alt="image"
                                     title="image"/>
                            </div>
                            <div class="info-details">
                                <h5>Fast &amp; Free Shipping</h5>
                                <span>On Order Over $90</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                        <div class="info-area d-flex flex-row align-items-center">
                            <div class="info-icon">
                                <img class="img-fluid blur-up lazyload" src="views/images/icons/save-20-small.png"
                                     data-src="views/images/icons/save-20-small.png" alt="image" title="image"/>
                            </div>
                            <div class="info-details">
                                <h5>Save 20% When You</h5>
                                <span>Call+01 2345700</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                        <div class="info-area d-flex flex-row align-items-center">
                            <div class="info-icon">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/icons/money-back-small.png"
                                     data-src="views/images/icons/money-back-small.png" alt="image" title="image"/>
                            </div>
                            <div class="info-details">
                                <h5>Money Back Gurantee</h5>
                                <span>30 Days money back gurantee!</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-12">
                        <div class="info-area d-flex flex-row align-items-center">
                            <div class="info-icon">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/icons/support-24-small.png"
                                     data-src="views/images/icons/support-24-small.png" alt="image" title="image"/>
                            </div>
                            <div class="info-details">
                                <h5>Support 24/7</h5>
                                <span>We support online 24 hours</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Information Section -->
    </main>
    <!-- End com.posh.App.Main Content -->

    <%@include file="includes/footer.jsp" %>

    <!-- Start Scroll Top -->
    <div id="scrollTop"><i class="ti-arrow-up"></i></div>
    <!-- End Scroll Top -->

    <!-- Start Search Drawer -->
    <div class="search-area modal fade top" id="searchform" tabindex="-1" role="dialog" aria-hidden="true"
         data-backdrop="true">
        <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
            <div class="container">
                <div class="modal-content search-inline align-content-center">
                    <div class="search-head position-relative">
                        <h3>What are you looking for?</h3>
                        <a class="search-close" data-dismiss="modal" aria-label="Close">
                            <i class="ti-close" aria-hidden="true"></i>
                        </a>
                    </div>
                    <form action="#" class="position-relative">
                        <input type="text" class="form-control" placeholder="Search Products..." required/>
                        <button class="search-btn" type="submit"><i class="ti-search"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Search Drawer -->

    <!-- Start Cart Drawer -->
    <div class="minicart-wrapper">
        <div class="cart-drawer model fade right show cart-drawer-right">
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
                    <li class="cart-item d-table">
                        <div class="pro-img d-table-cell align-middle">
                            <a href="product-details.html">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/products/cart-pro-76x76.jpg"
                                     data-src="views/images/products/cart-pro-76x76.jpg" alt="image"
                                     title="Donec pede justo fringilla"/>
                            </a>
                        </div>
                        <div class="item-info pl-4 text-left d-table-cell align-top">
                            <a href="product-details.html">Donec pede justo fringilla</a>
                            <p class="size-color">Sliver Black/XXL</p>
                            <p class="price">1 x $699.00</p>
                        </div>
                        <div class="item-right cart-remove d-table-cell align-middle">
                            <a class="edit mr-2" href="#"><i class="ti-pencil-alt"></i></a>
                            <a class="remove" href="#"><i class="ti-close"></i></a>
                        </div>
                    </li>
                    <li class="cart-item d-table">
                        <div class="pro-img d-table-cell align-middle">
                            <a href="product-details.html">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/products/cart-pro-76x76.jpg"
                                     data-src="views/images/products/cart-pro-76x76.jpg" alt="image"
                                     title="Sociosqu facilisi senectus nisi etiam"/>
                            </a>
                        </div>
                        <div class="item-info pl-4 text-left float-left d-table-cell align-top">
                            <a href="#">Sociosqu facilisi senectus nisi</a>
                            <p class="size-color">Red/XL</p>
                            <p class="price">1 x $299.00</p>
                        </div>
                        <div class="item-right cart-remove d-table-cell align-middle">
                            <a class="edit mr-2" href="#"><i class="ti-pencil-alt"></i></a>
                            <a class="remove" href="#"><i class="ti-close"></i></a>
                        </div>
                    </li>
                    <li class="cart-item d-table">
                        <div class="pro-img d-table-cell align-middle">
                            <a href="product-details.html">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/products/cart-pro-76x76.jpg"
                                     data-src="views/images/products/cart-pro-76x76.jpg" alt="image"
                                     title="Nullam scelerisque suscipit sociis"/>
                            </a>
                        </div>
                        <div class="item-info pl-4 text-left d-table-cell align-top">
                            <a href="product-details.html">Nullam scelerisque suscipit</a>
                            <p class="size-color">Silver/L</p>
                            <p class="price">1 x $239.00</p>
                        </div>
                        <div class="item-right cart-remove d-table-cell align-middle">
                            <a class="edit mr-2" href="#"><i class="ti-pencil-alt"></i></a>
                            <a class="remove" href="#"><i class="ti-close"></i></a>
                        </div>
                    </li>
                    <li class="cart-item d-table">
                        <div class="pro-img d-table-cell align-middle">
                            <a href="product-details.html">
                                <img class="img-fluid blur-up lazyload"
                                     src="views/images/products/cart-pro-76x76.jpg"
                                     data-src="views/images/products/cart-pro-76x76.jpg" alt="image"
                                     title="Pellentesque habitant morbi"/>
                            </a>
                        </div>
                        <div class="item-info pl-4 text-left d-table-cell align-top">
                            <a href="product-details.html">Pellentesque habitant morbi</a>
                            <p class="size-color">Black/M</p>
                            <p class="price">1 x $119.00</p>
                        </div>
                        <div class="item-right cart-remove d-table-cell align-middle">
                            <a class="edit mr-2" href="#"><i class="ti-pencil-alt"></i></a>
                            <a class="remove" href="#"><i class="ti-close"></i></a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="minicart-bottom-actions">
                <div class="pro-totals d-inline-block w-100">
                    <div class="items mb-1 clearfix">
                        <span class="item subtotal float-left">Subtotal:</span>
                        <span class="price-total float-right"><span class="price">$1356.00</span></span>
                    </div>
                    <div class="items mb-1 clearfix">
                        <span class="item shipping float-left">Delivery:</span>
                        <span class="price-total float-right"><span class="price">$10.00</span></span>
                    </div>
                    <div class="items mb-1 clearfix">
                        <span class="item tax float-left">Tax:</span>
                        <span class="price-total float-right"><span class="price">$0.00</span></span>
                    </div>
                    <div class="items clearfix">
                        <span class="item total float-left">Total:</span>
                        <span class="price-total float-right"><span class="price">$1366.00</span></span>
                    </div>
                </div>
                <div class="actions d-inline-block w-100 text-center">
                    <a class="btn btn-primary d-block mb-4 font-sm-14" href="cart.html">View Cart</a>
                    <a class="btn btn-secondary d-block font-sm-14" href="checkout.html">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Cart Drawer -->

    <!-- Start Product Cart Added Popup -->
    <div id="open-addtocart-popup" class="addtocart-popup magnific-popup mfp-hide">
        <div class="addtocart-inner-content text-center">
            <h4>Added to Cart Successfully</h4>
            <p class="pro-img"><img class="img-fluid blur-up lazyload"
                                    src="views/images/products/addtocart-popup.jpg"
                                    data-src="views/images/products/addtocart-popup.jpg" alt="image" title="image"/></p>
            <p class="modal-prod-name mb-1 font-15">Carb Fits Cigarette tiyer</p>
            <p class="mb-1 font-13">Color: Black</p>
            <p class="font-13">Quantity: 1</p>
            <div class="addcart-total">
                There are <b>1</b> items in your cart
                <div class="cart-total mt-2">
                    Total: <b class="price">$113.88</b>
                </div>
            </div>
            <div class="button-action">
                <button class="btn btn-secondary btn-block mb-3 continue-shopping close-popup">Continue
                    Shopping
                </button>
                <a href="cart.html" class="btn btn-primary btn-block view-cart">View Cart</a>
            </div>
        </div>
    </div>
    <!-- End Product Cart Added Popup -->

    <!-- Start Product Quick View Popup -->
    <div id="open-quickview-popup" class="quickview-popup magnific-popup mfp-hide">
        <div class="quickview-content">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6">
                    <div class="product-single-photo slider thumbnails-single">
                        <div class="single-item"><img class="img-fluid blur-up lazyload"
                                                      src="views/images/products/quick-view-1.jpg"
                                                      data-src="views/images/products/quick-view-1.jpg" alt="image"
                                                      title="image"/>
                        </div>
                        <div class="single-item"><img class="img-fluid blur-up lazyload"
                                                      src="views/images/products/quick-view-1.jpg"
                                                      data-src="views/images/products/quick-view-1.jpg" alt="image"
                                                      title="image"/>
                        </div>
                        <div class="single-item"><img class="img-fluid blur-up lazyload"
                                                      src="views/images/products/quick-view-1.jpg"
                                                      data-src="views/images/products/quick-view-1.jpg" alt="image"
                                                      title="image"/>
                        </div>
                        <div class="single-item"><img class="img-fluid blur-up lazyload"
                                                      src="views/images/products/quick-view-1.jpg"
                                                      data-src="views/images/products/quick-view-1.jpg" alt="image"
                                                      title="image"/>
                        </div>
                        <div class="single-item"><img class="img-fluid blur-up lazyload"
                                                      src="views/images/products/quick-view-1.jpg"
                                                      data-src="views/images/products/quick-view-1.jpg" alt="image"
                                                      title="image"/>
                        </div>
                    </div>
                    <div class="product-thumb slider thumbnail-items">
                        <div class="thumb-item"><img class="img-fluid blur-up lazyload"
                                                     src="views/images/products/quick-view-1-item.jpg"
                                                     data-src="views/images/products/quick-view-1-item.jpg" alt="image"
                                                     title="image"/>
                        </div>
                        <div class="thumb-item"><img class="img-fluid blur-up lazyload"
                                                     src="views/images/products/quick-view-1-item.jpg"
                                                     data-src="views/images/products/quick-view-1-item.jpg" alt="image"
                                                     title="image"/>
                        </div>
                        <div class="thumb-item"><img class="img-fluid blur-up lazyload"
                                                     src="views/images/products/quick-view-1-item.jpg"
                                                     data-src="views/images/products/quick-view-1-item.jpg" alt="image"
                                                     title="image"/>
                        </div>
                        <div class="thumb-item"><img class="img-fluid blur-up lazyload"
                                                     src="views/images/products/quick-view-1-item.jpg"
                                                     data-src="views/images/products/quick-view-1-item.jpg" alt="image"
                                                     title="image"/>
                        </div>
                        <div class="thumb-item"><img class="img-fluid blur-up lazyload"
                                                     src="views/images/products/quick-view-1-item.jpg"
                                                     data-src="views/images/products/quick-view-1-item.jpg" alt="image"
                                                     title="image"/>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12 col-md-6">
                    <div class="profuct-info">
                        <h3 class="product-title">Quick View Popup Product</h3>
                        <div class="pro-revi-arrow clearfix">
                            <div class="product-starrating pull-left">
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star"></i>
                                <i class="spr-icon fa fa-star-o"></i>
                                <i class="spr-icon fa fa-star-o"></i>
                                <span>5 Reviews</span>
                            </div>
                            <!-- <div class="pro-arrow pull-right">
                                    <a class="pro-next" href="product-details.html"><i class="ti-angle-left"></i></a>
                                    <a class="pro-prev" href="product-details-classic.html"><i class="ti-angle-right"></i></a>
                                </div> -->
                        </div>
                        <ul class="row pro-info-list">
                            <li class="col-12 col-md-4 col-sm-4 instock text-sm-left">In Stock</li>
                            <li class="col-12 col-md-4 col-sm-4 vendor text-sm-center"><b>Vendor:</b> Autoparts</li>
                        </ul>
                    </div>
                    <ul class="d-sm-flex flex-sm-row align-items-sm-center product-price-info">
                        <li class="product-price m-0"><span class="compare-price">$499.00</span><span
                                class="sale-price">$399.00</span></li>
                    </ul>
                    <ul class="d-flex flex-column pro-details">
                        <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Lorem ipsum dolor sit amet,
                            consectetur elit.
                        </li>
                        <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Maecenas vehicula lorem et facilisis
                            eleifend.
                        </li>
                        <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Quisque mattis augue quis risus
                            euismod pharetra.
                        </li>
                        <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Curabitur bibendum massa vitae risus
                            lacinia rutrum.
                        </li>
                    </ul>
                    <div class="product-size">
                        <p>Color: <b>XL</b></p>
                        <ul class="d-flex flex-row align-items-center color-item" data-toggle="buttons">
                            <li class="btn x active" data-toggle="tooltip" data-placement="top" title="x">
                                <span>X</span></li>
                            <li class="btn xl" data-toggle="tooltip" data-placement="top" title="xl"><span>XL</span>
                            </li>
                            <li class="btn m" data-toggle="tooltip" data-placement="top" title="m"><span>M</span>
                            </li>
                            <li class="btn s" data-toggle="tooltip" data-placement="top" title="s"><span>S</span>
                            </li>
                            <li class="btn xxl" data-toggle="tooltip" data-placement="top" title="xxl">
                                <span>XXL</span></li>
                        </ul>
                    </div>
                    <div class="addToBox d-sm-flex flex-sm-row">
                        <div class="product-form-item product-quantity">
                            <div class="qty-box">
                                <button type="button" class="qtyminus button" value=""><i
                                        class="fa fa-minus"></i></button>
                                <input type="text" name='quantity' value='1' class="qty-input"/>
                                <button type="button" class="qtyplus button" value=""><i
                                        class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div class="product-form-item product-submit btn-block">
                            <a href="#open-addtocart-popup"
                               class="btn btn-primary btn-block product-btn-cart open-addtocart-popup">Add to
                                Cart</a>
                        </div>
                    </div>
                    <div class="wishlistOuter">
                        <a href="#open-wishlist-popup" class="open-wishlist-popup"><i class="ti-heart mr-2"></i> Add
                            To Wishlist</a>
                    </div>
                    <div class="social-media">
                        <ul class="d-flex flex-row">
                            <li><span>Share:</span></li>
                            <li><a href="#" title="Facebook"><i class="ti-facebook"></i></a></li>
                            <li><a href="#" title="Twitter"><i class="ti-twitter"></i></a></li>
                            <li><a href="#" title="Google Plus"><i class="ti-google"></i></a></li>
                            <li><a href="#" title="Pinterest"><i class="ti-pinterest"></i></a></li>
                            <li><a href="#" title="Email"><i class="ti-email"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Quick View Popup -->

    <!-- Start Cookie Message -->
    <div id="cookie-message" class="alert fade show" role="alert">
        <p>This is a standard cookie notice which you can easily adapt or disable as you like in the admin. We yse
            cookie to ensure that we give you the best expenrience on our website.</p>
        <div class="cookie-action">
            <a class="cookie-more-info" href="#"> Privacy Policy </a>
            <a class="cookie-accept" href="#" data-dismiss="alert" aria-label="Close">Accept <i
                    class="ti-check"></i></a>
        </div>
    </div>
    <!-- End Cookie Message -->

    <!-- Start Product Suggestion -->
    <div class="product-suggestion-content clearfix border-0 rounded-0 alert fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <i class="ti-close" aria-hidden="true"></i>
        </button>
        <div class="product-suggestion">
            <div class="suggestion-item">
                <div class="d-table suggestion-product">
                    <div class="d-table-cell align-middle suggestion-img">
                        <a href="product-details.html"><img class="img-fluid blur-up lazyload"
                                                            src="views/images/products/product-1-80x80.jpg"
                                                            data-src="views/images/products/product-1-80x80.jpg"
                                                            width="100" alt="image"
                                                            title="image"/></a>
                    </div>
                    <div class="d-table-cell align-middle pl-3 suggestion-detail">
                        <span>Someone purchaed a</span>
                        <a class="my-1 d-block" href="#">Carb Fits Cigarette tiyer</a>
                        <span>18 minutes ago from London. Great Britain</span>
                    </div>
                </div>
            </div>
            <div class="suggestion-item">
                <div class="d-table suggestion-product">
                    <div class="d-table-cell align-middle suggestion-img">
                        <a href="product-details.html"><img class="img-fluid blur-up lazyload"
                                                            src="views/images/products/product-1-80x80.jpg"
                                                            data-src="views/images/products/product-1-80x80.jpg"
                                                            width="100" alt="image"
                                                            title="image"/></a>
                    </div>
                    <div class="d-table-cell align-middle pl-3 suggestion-detail">
                        <span>Someone purchaed a</span>
                        <a class="my-1 d-block" href="#">Garbage Plush Case</a>
                        <span>14 Minutes ago from New York, USA</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Suggestion-->

    <!-- Overlay -->
    <div class="overlay"></div>
</div>
<!-- End com.posh.App.Main Wrapper -->

<!-- ******** JS Files ******** -->
<!-- Plugin JS -->
<script src="views/js/plugins.js"></script>

<!-- com.posh.App.Main JS -->
<script src="views/js/main.js"></script>
</body>

</html>
