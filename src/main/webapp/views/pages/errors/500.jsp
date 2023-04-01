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
    <%@include file="../includes/header.jsp" %>

    <!-- Start com.posh.App.Main Content -->
    <main class="main-content">
        <!-- Start Breadcrumb -->
        <div class="breadcrumbs text-center">
            <div class="container">
                <h1>page not found</h1>
                <ul class="breadcrumb bg-transparent m-0 p-0 justify-content-center">
                    <li class="breadcrumb-item"><a href="../index.jsp" title="Home">Home</a></li>
                    <li class="breadcrumb-item active">Page not found</li>
                </ul>
            </div>
        </div>
        <!-- End Breadcrumb -->

        <!-- Start Page Not Found -->
        <div class="not-found-page my-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-sm-10 col-md-8 col-lg-8 col-xl-7 text-center">
                        <div class="page-not-found">
                            <h1>500</h1>
                            <h2>opps! page not be found</h2>
                            <p>Sorry but the page you are looking for does not exist, have been removed, name changed or
                                is
                                temporarity unavailable.</p>
                            <form action="#" class="search-form needs-validation" novalidate>
                                <div class="input-group mb-5">
                                    <input type="text" class="form-control" placeholder="Search..." aria-label="Search"
                                           aria-describedby="Search" required/>
                                    <div class="input-group-append">
                                        <button type="submit" class="input-group-text search-btn btn btn-secondary"
                                                id="Search"><i class="ti-search"></i></button>
                                    </div>
                                </div>
                            </form>
                            <a href="../index.jsp" class="back-btn btn btn-primary">Back to home page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Page Not Found -->
    </main>
    <!-- End com.posh.App.Main Content -->

    <%@include file="../includes/footer.jsp" %>

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
                        <input type="text" class="form-control" placeholder="Search Products..."/>
                        <button class="search-btn" type="submit">
                            <i class="ti-search"></i>
                        </button>
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
                                <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg"
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
                                <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg"
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
                                <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg"
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
                                <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg"
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
                        <span class="item shipping float-left">Shipping:</span>
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

    <!-- Overlay -->
    <div class="overlay"></div>

</div>
<!--  End com.posh.App.Main Wrapper -->

<!-- ******** JS Files ******** -->
<!-- Plugin JS -->
<script src="views/js/plugins.js"></script>

<!-- com.posh.App.Main JS -->
<script src="views/js/main.js"></script>

</body>
</html>

