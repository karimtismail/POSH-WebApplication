<!DOCTYPE html>
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
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <script src=http://code.jquery.com/jquery-latest.min.js></script>
 </head>

    <body onload = "loadProducts();" class="template-product-grid-leftsidebar">
    <%@include file="includes/header.jsp" %>

        <!-- Start Page Loader -->
        <div class="page-loading"></div>
        <!-- End Page Loader -->

        <!--  Start Main Wrapper -->
        <div class="main-wrapper cart-drawer-push">
            <!-- Start Main Content -->
            <main class="main-content">
                <!-- Start Breadcrumb -->
                <div class="breadcrumbs text-center">
                    <div class="container">
                        <h1>Shop Grid Left Sidebar</h1>
                        <ul class="breadcrumb bg-transparent m-0 p-0 justify-content-center">
                            <li class="breadcrumb-item"><a href="index.html" title="Home">Home</a></li>
                            <li class="breadcrumb-item active">Shop Grid Left Sidebar</li>
                        </ul>
                    </div>
                </div>
                <!-- End Breadcrumb -->

                <!-- Start Product with Filter -->
                <div class="product-filter-sidebar">
                    <div class="container">
                        <div class="row">
                            <!-- Start Product Filter -->
                            <div class="col-12 col-sm-12 col-lg-3 sidebar sidebar-left">
                                <!-- Start YMM Search Box -->
                                <div class="ymm-search-box">
                                    <div class="ymm-search">
                                        <h1>Shop by Parts</h1>
                                        <p>Quick & Easy Shop by Parts</p>
                                        <form action="#">
                                            <div class="form-group">
                                                <select class="form-control select2" id="sel1" name="sellist1">
                                                    <option value="" disabled selected>Select Year</option>
                                                    <option value="1">2019</option>
                                                    <option value="2">2018</option>
                                                    <option value="3">2017</option>
                                                    <option value="3">2016</option>
                                                    <option value="3">2015</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-control select2" id="sel2" name="sellist2">
                                                    <option value="" disabled selected>Select Make</option>
                                                    <option value="1">Audi</option>
                                                    <option value="2">Ford</option>
                                                    <option value="3">Hyundai</option>
                                                    <option value="3">TATA</option>
                                                    <option value="3">Volvo</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-control select2" id="sel3" name="sellist3">
                                                    <option value="" disabled selected>Select Model</option>
                                                    <option value="1">Ford Pinto</option>
                                                    <option value="2">Honda Fitta</option>
                                                    <option value="3">Hyundai Santa Fe</option>
                                                    <option value="3">Mazda Moco</option>
                                                    <option value="3">Skoda Laura</option>
                                                </select>
                                            </div>
                                            <div class="actions-btn d-flex">
                                                <button type="submit" class="btn btn-primary w-50">Find</button>
                                                <button type="button" class="btn btn-secondary w-50">Reset</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- End YMM Search Box -->

                                <!-- Start Shop By -->
                                <div class="filter-block">
                                    <h3 class="block-title shopby">SHOP BY</h3>
                                    <div class="block-content">
                                        <!-- Start Categories -->
                                        <div class="block-item categories">
                                            <h4 class="sub-title">Categories</h4>
                                            <ul class="block-details list sidebar-collections">
                                                <li class="cat-submenu-link"><a href="#;">Drills & Mixers</a>
                                                    <ul class="cat-submenu-list">
                                                        <li class="item"><a href="#">Portable Electric</a></li>
                                                        <li class="item"><a href="#">Gas Hand-Held</a></li>
                                                        <li class="item"><a href="#">Mega Mixing</a></li>
                                                        <li class="item more"><a href="#">View More Category</a></li>
                                                    </ul>
                                                </li>
                                                <li class="cat-submenu-link"><a href="#;">Cordless Screwdrivers</a>
                                                    <ul class="cat-submenu-list">
                                                        <li class="item"><a href="#">Portable Electric</a></li>
                                                        <li class="item"><a href="#">Gas Hand-Held</a></li>
                                                        <li class="item"><a href="#">Mega Mixing</a></li>
                                                        <li class="item more"><a href="">View More Category</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#">Screwdrivers</a></li>
                                                <li><a href="#">Wrenches</a></li>
                                                <li><a href="#">Grinding Machines</a></li>
                                                <li><a href="#">Milling Cutters</a></li>
                                                <li><a href="#">Electric Spray Guns</a></li>
                                                <li><a href="#">Jigsaws</a></li>
                                                <li><a href="#">Jackhammers</a>
                                                <li class="item more"><a href="">View More Category</a></li>
                                            </ul>
                                        </div>
                                        <!-- End Categories -->
                                        <!-- Start Price -->
                                        <div class="block-item price">
                                            <h4 class="sub-title">Price</h4>
                                            <div class="block-details">
                                                <div class="rangeslider">
                                                    <div class="slider-range"></div>
                                                </div>
                                                <div class="form-group m-0 d-flex justify-content-between align-items-center">
                                                    <label class="range-number m-0 pull-left"></label>
                                                    <button type="submit" class="btn btn-primary pull-right find-btn">Find</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Price -->
                                        <!-- Start Size -->
                                        <div class="block-item size">
                                            <h4 class="sub-title">Size</h4>
                                            <div class="block-details product-size">
                                                <ul class="d-flex flex-row align-items-center color-item">
                                                    <li class="x active"><span>X</span></li>
                                                    <li class="xl"><span>XL</span></li>
                                                    <li class="l"><span>L</span></li>
                                                    <li class="m"><span>M</span></li>
                                                    <li class="s"><span>S</span></li>
                                                    <li class="s"><span>XXL</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- End Size -->
                                        <!-- Start Brand -->
                                        <div class="block-item brand">
                                            <h4 class="sub-title">Brand</h4>
                                            <ul class="block-details list sidebar-brand">
                                                <li><a href="#">Toyota</a></li>
                                                <li><a href="#">Mercedes</a></li>
                                                <li><a href="#">Kia</a></li>
                                                <li><a href="#">Audi</a></li>
                                                <li><a href="#">Honda</a></li>
                                                <li><a href="#">BMW</a></li>
                                            </ul>
                                        </div>
                                        <!-- End Brand -->
                                    </div>
                                </div>
                                <!-- End Shop By -->

                                <!-- Start Popular Products -->
                                <div class="cms-block popular-products">
                                    <h4 class="sub-title">Popular Products</h4>
                                    <div class="cms-block-content">
                                        <ul class="d-flex flex-column color-item">
                                            <li>
                                                <div class="pop-img pull-left mr-3"><a href="product-details.html"><img class="img-fluid blur-up lazyload" src="views/images/products/product-1.jpg" data-src="views/images/products/product-1.jpg" alt="image" title="image" /></a></div>
                                                <div class="pop-dec pull-left">
                                                    <a class="d-block" href="product-details.html">Carbon Fiber Steering Wheel</a>
                                                    <span class="d-block product-price">$98.00</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="pop-img pull-left mr-3"><a href="product-details.html"><img class="img-fluid blur-up lazyload" src="views/images/products/product-1.jpg" data-src="views/images/products/product-1.jpg" alt="image" title="image" /></a></div>
                                                <div class="pop-dec pull-left">
                                                    <a class="d-block" href="product-details.html">Car Precedent LED Headlight</a>
                                                    <span class="d-block product-price">$100.00</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="pop-img pull-left mr-3"><a href="product-details.html"><img class="img-fluid blur-up lazyload" src="views/images/products/product-1.jpg" data-src="views/images/products/product-1.jpg" alt="image" title="image" /></a></div>
                                                <div class="pop-dec pull-left">
                                                    <a class="d-block" href="product-details.html">Single DIN Stereo Dash Kit</a>
                                                    <span class="d-block product-price">$190.00</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Popular Products -->

                                <!-- Start Popular Tags -->
                                <div class="cms-block popular-tags">
                                    <h4 class="sub-title">Popular Tags</h4>
                                    <div class="cms-block-content">
                                        <ul class="d-flex flex-row flex-wrap color-item">
                                            <li><a href="#">parts</a></li>
                                            <li><a href="#">bike</a></li>
                                            <li><a href="#">motor bike</a></li>
                                            <li><a href="#">car seat</a></li>
                                            <li><a href="#">breaks</a></li>
                                            <li><a href="#">helmet</a></li>
                                            <li class="tag-btn"><a class="btn btn-secondary" href="#">View All</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Popular Tags -->
                            </div>
                            <!-- End Product Filter -->

                            <!-- Start Products -->
                            <div class="product-view-items product-grid col-12 col-sm-12 col-lg-9 sidebar-right">
                                <!-- Start Collection Banner Image -->
                                <div class="collection-banner-img">
                                    <div class="row">
                                        <div class="col-12">
                                            <img class="img-fluid blur-up lazyload" src="views/images/collection/collection-sideleft-banner.jpg" data-src="views/images/collection/collection-sideleft-banner.jpg" alt="image" title="image" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Collection Banner Image -->

                                <!-- Start Filters Tollbar -->
                                <div class="filters-toolbar">
                                    <div class="row row-sp align-items-center">
                                        <div class="col-sp col-4 col-sm-4 text-left order-1 order-sm-0">
                                            <div class="filters-item">
                                                <a href="shop-grid-left-sidebar.html" title="Grid" class="btn active" data-view="grid"><i class="ti-view-grid"></i></a><a href="shop-list-left-sidebar.html" title="List" class="btn" data-view="list"><i class="ti-view-list-alt"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-sp col-12 col-sm-4 text-center mb-4 mb-sm-0 order-0 order-sm-1">
                                            <p class="m-0">Showing 1–16 of 21 results</p>
                                        </div>
                                        <div class="col-sp col-8 col-sm-4 text-right order-2 order-sm-2">
                                            <div class="filters-item">
                                                <div class="form-group m-0">
                                                    <label for="Sortby">Sort by:</label>
                                                    <select id="Sortby" class="form-control select2">
                                                        <option value="manual">Featured</option>
                                                        <option value="best-selling">Best Selling</option>
                                                        <option value="title-ascending">Alphabetically, A-Z</option>
                                                        <option value="title-descending">Alphabetically, Z-A</option>
                                                        <option value="price-ascending">Price, low to high</option>
                                                        <option value="price-descending">Price, high to low</option>
                                                        <option value="created-descending">Date, new to old</option>
                                                        <option value="created-ascending">Date, old to new</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Filters Tollbar -->

                                <!-- Start Products Grid -->
                                <div class="products products-grid">
                                    <div id = "product_list" class="row row-sp row-eq-height">

                                    </div>

                                    <!-- Start Load More Button -->
                                    <div class="product-readmore text-center">
                                        <button type="submit" class="btn btn-secondary">Load More</button>
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
                                        <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg" data-src="views/images/products/cart-pro-76x76.jpg" alt="image" title="Donec pede justo fringilla" />
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
                                        <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg" data-src="views/images/products/cart-pro-76x76.jpg" alt="image" title="Sociosqu facilisi senectus nisi etiam" />
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
                                        <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg" data-src="views/images/products/cart-pro-76x76.jpg" alt="image" title="Nullam scelerisque suscipit sociis" />
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
                                        <img class="img-fluid blur-up lazyload" src="views/images/products/cart-pro-76x76.jpg" data-src="views/images/products/cart-pro-76x76.jpg" alt="image" title="Pellentesque habitant morbi" />
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

            <!-- Start Product Cart Added Popup -->
            <div id="open-addtocart-popup" class="addtocart-popup magnific-popup mfp-hide">
                <div class="addtocart-inner-content text-center">
                    <h4>Added to Cart Successfully</h4>
                    <p class="pro-img"><img class="img-fluid blur-up lazyload" src="views/images/products/addtocart-popup.jpg" data-src="views/images/products/addtocart-popup.jpg" alt="image" title="image" /></p>
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
                        <button class="btn btn-secondary btn-block mb-3 continue-shopping close-popup">Continue Shopping</button>
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
                                <div class="single-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1.jpg" data-src="views/images/products/quick-view-1.jpg" alt="image" title="image" /></div>
                                <div class="single-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1.jpg" data-src="views/images/products/quick-view-1.jpg" alt="image" title="image" /></div>
                                <div class="single-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1.jpg" data-src="views/images/products/quick-view-1.jpg" alt="image" title="image" /></div>
                                <div class="single-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1.jpg" data-src="views/images/products/quick-view-1.jpg" alt="image" title="image" /></div>
                                <div class="single-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1.jpg" data-src="views/images/products/quick-view-1.jpg" alt="image" title="image" /></div>
                            </div>
                            <div class="product-thumb slider thumbnail-items">
                                <div class="thumb-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1-item.jpg" data-src="views/images/products/quick-view-1-item.jpg" alt="image" title="image" /></div>
                                <div class="thumb-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1-item.jpg" data-src="views/images/products/quick-view-1-item.jpg" alt="image" title="image" /></div>
                                <div class="thumb-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1-item.jpg" data-src="views/images/products/quick-view-1-item.jpg" alt="image" title="image" /></div>
                                <div class="thumb-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1-item.jpg" data-src="views/images/products/quick-view-1-item.jpg" alt="image" title="image" /></div>
                                <div class="thumb-item"><img class="img-fluid blur-up lazyload" src="views/images/products/quick-view-1-item.jpg" data-src="views/images/products/quick-view-1-item.jpg" alt="image" title="image" /></div>
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
                                    <div class="pro-arrow pull-right">
                                        <a class="pro-next" href="product-details.html"><i class="ti-angle-left"></i></a>
                                        <a class="pro-prev" href="product-details-classic.html"><i class="ti-angle-right"></i></a>
                                    </div>
                                </div>
                                <ul class="row pro-info-list">
                                    <li class="col-12 col-md-4 col-sm-4 instock text-sm-left">In Stock</li>
                                    <li class="col-12 col-md-4 col-sm-4 vendor text-sm-center"><b>Vendor:</b> Autoparts</li>
                                    <li class="col-12 col-md-4 col-sm-4 sku text-sm-right"><b>SKU:</b> 19115-rdxs</li>
                                </ul>
                            </div>
                            <ul class="d-sm-flex flex-sm-row align-items-sm-center product-price-info">
                                <li class="product-price m-0"><span class="compare-price">$499.00</span><span class="sale-price">$399.00</span></li>
                                <li class="save-price">You Save <span class="save-count">$100.00 (10%)</span></li>
                            </ul>
                            <p class="sold-in-last"><span class="align-middle">10 sold in last 20 hours</span></p>
                            <ul class="d-flex flex-column pro-details">
                                <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Lorem ipsum dolor sit amet, consectetur elit.</li>
                                <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Maecenas vehicula lorem et facilisis eleifend.</li>
                                <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Quisque mattis augue quis risus euismod pharetra.</li>
                                <li><i class="fa fa-check mr-2" aria-hidden="true"></i>Curabitur bibendum massa vitae risus lacinia rutrum.</li>
                            </ul>

                            <div class="product-size">
                                <p>Color: <b>XL</b></p>
                                <ul class="d-flex flex-row align-items-center color-item" data-toggle="buttons">
                                    <li class="btn x active" data-toggle="tooltip" data-placement="top" title="x"><span>X</span></li>
                                    <li class="btn xl" data-toggle="tooltip" data-placement="top" title="xl"><span>XL</span></li>
                                    <li class="btn m" data-toggle="tooltip" data-placement="top" title="m"><span>M</span></li>
                                    <li class="btn s" data-toggle="tooltip" data-placement="top" title="s"><span>S</span></li>
                                    <li class="btn xxl" data-toggle="tooltip" data-placement="top" title="xxl"><span>XXL</span></li>
                                </ul>
                            </div>
                            <div class="addToBox d-sm-flex flex-sm-row">
                                <div class="product-form-item product-quantity">
                                    <div class="qty-box">
                                        <button type="button" class="qtyminus button" value=""><i class="fa fa-minus"></i></button>
                                        <input type="text" name='quantity' value='1' class="qty-input" />
                                        <button type="button" class="qtyplus button" value=""><i class="fa fa-plus"></i></button>
                                    </div>
                                </div>
                                <div class="product-form-item product-submit btn-block">
                                    <a href="#open-addtocart-popup" class="btn btn-primary btn-block product-btn-cart open-addtocart-popup">Add to Cart</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product Quick View Popup -->

            <!-- Overlay -->
            <div class="overlay"></div>

        </div>
        <!--  End Main Wrapper -->

        <%@include file="includes/footer.jsp" %>

        <!-- ******** JS Files ******** -->
        <!-- Plugin JS -->
        <script src="views/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="views/js/main.js"></script>

        <script src="views/js/product.js"></script>

    </body>
</html>