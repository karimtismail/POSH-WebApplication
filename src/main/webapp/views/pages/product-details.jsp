 <jsp:useBean id="product" type="com.posh.dtos.productdtos.FullProductDto"
    scope="request" />
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
        <body onload="loadRelatedProducts('${product.categoryId}');"
            class="template-product-detail-default sticky-view-product">

            <!-- Start Page Loader -->
            <div class="page-loading"></div>
            <!-- End Page Loader -->

            <!--  Start Main Wrapper -->
            <div class="main-wrapper cart-drawer-push">
                <%@include file="includes/header.jsp" %>

                    <!-- Start Main Content -->
                    <main class="main-content">
                        <!-- Start Breadcrumb -->
                        <div class="breadcrumbs text-center">
                            <div class="container">
                                <h1>Product Detail Default </h1>
                                <ul class="breadcrumb bg-transparent m-0 p-0
                                    justify-content-center">
                                    <li class="breadcrumb-item"><a
                                            href="index.html" title="Home">Home</a></li>
                                    <li class="breadcrumb-item active">Product
                                        Detail Default </li>
                                </ul>
                            </div>
                        </div>
                        <!-- End Breadcrumb -->

                        <!-- Start Single Product Detail -->
                        <div class="product-single">
                            <div class="container">
                                <div class="row">
                                    <!-- Start Product Store Features -->
                                    <div class="col-12 col-sm-12 col-md-6
                                        product-store-features">
                                        <!-- Start Product Thumb Slider -->
                                        <div class="product-img-thumb">
                                            <div
                                                class="product-single-img-slider
                                                position-relative">
                                                <!-- Start Product Label -->
                                                <div class="product-label">
                                                    <span class="label new">New</span>
                                                    <span class="label
                                                        sale">Sale</span>
                                                </div>
                                                <!-- End Product Label -->
                                                <!-- Start Product Single Images -->
                                                <div
                                                    class="product-single-photo
                                                    slider
                                                    thumbnails-single">
                                                    <c:forEach var="image"
                                                        items="${product.images}">
                                                        <div
                                                            class="single-item
                                                            zoom
                                                            product-gallery-image">
                                                            <img
                                                                class="img-fluid
                                                                blur-up
                                                                lazyload"
                                                                src="resource?image=${image.imageName}"
                                                                data-src="resource?image=${image.imageName}"
                                                                alt="image"
                                                                title="image"
                                                                style="width:
                                                                500px; height:
                                                                600px"
                                                                />
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <!-- End Product Single Images -->
                                                <!-- Start Product Action -->
                                                <div
                                                    class="product-gallery-actions">
                                                    <a
                                                        href="#open-video-popup"
                                                        class="action-btn
                                                        video-popup
                                                        open-video-popup"><i
                                                            class="ti-control-play"></i></a>
                                                    <a id="lightgallery-btn"
                                                        class="action-btn
                                                        gallery-popup
                                                        lightgallery-btn"><i
                                                            class="ti-zoom-in"></i></a>
                                                </div>
                                                <!-- End Product Action -->
                                                <!-- Start Product Details Video Popup -->
                                                <div id="open-video-popup"
                                                    class="youtube-video-popup
                                                    magnific-popup
                                                    mfp-hide">
                                                    <div
                                                        class="embed-responsive
                                                        embed-responsive-16by9">
                                                        <iframe
                                                            class="embed-responsive-item"
                                                            src="about:blank"
                                                            allowfullscreen=""></iframe>
                                                    </div>
                                                </div>
                                                <!-- End Product Details Video Popup -->
                                            </div>

                                            <!-- Start Product Thumb Images -->
                                            <div class="product-thumb slider
                                                thumbnail-items">
                                                <c:forEach var="image"
                                                    items="${product.images}">
                                                    <div class="thumb-item"><img
                                                            class="img-fluid
                                                            blur-up
                                                            lazyload"
                                                            src="resource?image=${image.imageName}"
                                                            data-src="resource?image=${image.imageName}"
                                                            alt="image"
                                                            title="image" /></div>
                                                </c:forEach>
                                            </div>
                                            <!-- End Product Thumb Images -->
                                        </div>
                                        <!-- End Product Thumb Slider -->
                                    </div>
                                    <!-- End Product Store Features -->

                                    <!-- Start Product Info Details -->
                                    <div class="col-12 col-sm-12 col-md-6
                                        product-info-details">
                                        <!-- Start Product Info -->
                                        <div class="profuct-info">
                                            <div class="pro-revi-arrow
                                                clearfix">
                                                <div
                                                    class="product-starrating
                                                    pull-left">
                                                    <i class="spr-icon fa
                                                        fa-star"></i>
                                                    <i class="spr-icon fa
                                                        fa-star"></i>
                                                    <i class="spr-icon fa
                                                        fa-star"></i>
                                                    <i class="spr-icon fa
                                                        fa-star"></i>
                                                    <i class="spr-icon fa
                                                        fa-star-o"></i>
                                                    <span>4 Reviews</span>
                                                </div>
                                            </div>
                                            <ul class="row pro-info-list">
                                                <li class="col-12 col-md-4
                                                    col-sm-4 instock
                                                    text-sm-left">
                                                    <c:if
                                                        test="${product.quantity
                                                    <10}">
                                                        only
                                                        ${product.quantity}
                                                        left in Stock
                                                    </c:if>
                                                    <c:if
                                                        test="${product.quantity>
                                                        10}">
                                                        in Stock
                                                    </c:if>

                                                </li>
                                                <li class="col-12 col-md-4
                                                    col-sm-4 vendor
                                                    text-sm-center"><b>Vendor:</b>
                                                    ${product.vendor}</li>
                                            </ul>
                                        </div>
                                        <!-- End Product Info -->

                                        <!-- Start Product Price -->
                                        <ul class="d-sm-flex flex-sm-row
                                            align-items-sm-center
                                            product-price-info">
                                            <li class="product-name m-0"><span
                                                    class="name">${product.name}</span>
                                            </li>

                                        </ul>
                                        <ul class="d-sm-flex flex-sm-row
                                            align-items-sm-center
                                            product-price-info">
                                            <li class="product-price m-0"><span
                                                    class="sale-price">${product.price}$</span></li>
                                        </ul>
                                        <!-- End Product Price -->

                                        <!-- Start Product List Info -->
                                        <ul class="d-flex flex-column
                                            pro-lists">
                                            <li><i class="fa fa-check mr-2"
                                                    aria-hidden="true"></i>Made
                                                in ${product.madeIn}</li>
                                            <li><i class="fa fa-check mr-2"
                                                    aria-hidden="true"></i>${product.brand}
                                                Brand</li>
                                        </ul>
                                        <!-- End Product List Info -->

                                        <!-- Start Cart Box -->
                                        <div class="addToBox">
                                            <div
                                                class="d-sm-flex
                                                flex-sm-row">
                                                <!-- Start Product Quantity -->
                                                <div
                                                    class="product-form-item
                                                    product-quantity">
                                                    <div class="qty-box">
                                                        <button
                                                            type="button"
                                                            class="qtyminus
                                                            button"
                                                            value=""><i
                                                                class="fa
                                                                fa-minus"></i></button>
                                                        <input
                                                            id="quantity_field"
                                                            type="text"
                                                            name='quantity'
                                                            value='1'
                                                            class="qty-input"
                                                            />
                                                        <button
                                                            type="button"
                                                            class="qtyplus
                                                            button"
                                                            value=""><i
                                                                class="fa
                                                                fa-plus"></i></button>
                                                    </div>
                                                </div>
                                                <!-- End Product Quantity -->
                                                <!-- Start Product Add Cart -->
                                                <div
                                                    class="product-form-item
                                                    product-submit
                                                    btn-block">
                                                    <button id="addToCart"
                                                        onclick="addProdToCart('${product.productId}');"
                                                        href="#open-addtocart-popup"
                                                        class="btn
                                                        btn-primary
                                                        btn-block
                                                        product-btn-cart
                                                        add-cart
                                                        open-addtocart-popup">Add
                                                        To Cart</button>
                                                </div>
                                                <!-- End Product Add Cart -->
                                                <!-- Start Product Buy Now -->
                                                <div
                                                    class="product-form-item
                                                    product-submit pro-buy
                                                    btn-block">
                                                    <a href="checkoutSingleProduct?id=${product.productId}&name=${product.name}&price=${product.price}&quantity=1&image=${product.images.get(0).imageName}"
                                                        class="btn
                                                        btn-secondary
                                                        btn-block
                                                        product-btn-cart
                                                        buy-btn">Buy It Now</a>
                                                </div>
                                                <!-- End Product Buy Now -->
                                            </div>
                                        </div>
                                        <!-- End Cart Box -->

                                        <!-- Start Product Size Shipping Info -->
                                        <!-- Start Checkout Info -->
                                        <div class="checkout-safe">
                                            <fieldset>
                                                <legend>Guaranteed Safe
                                                    Checkout</legend>
                                                <img class="img-fluid"
                                                    src="views/images/icons/checkout-icon.png"
                                                    alt="Guaranteed Safe
                                                    Checkout"
                                                    title="Guaranteed
                                                    Safe Checkout" />
                                            </fieldset>
                                        </div>
                                        <!-- Start Store Features -->
                                        <div class="store-features">
                                            <div class="row">
                                                <div class="col-12 col-sm-6
                                                    col-md-6 col-lg-6">
                                                    <div class="info-area
                                                        d-table clearfix">
                                                        <div
                                                            class="info-icon
                                                            d-table-cell
                                                            align-middle">
                                                            <img
                                                                class="img-fluid
                                                                blur-up
                                                                lazyload"
                                                                src="views/images/icons/free-shipping.png"
                                                                data-src="views/images/icons/free-shipping.png"
                                                                alt="image"
                                                                title="image"
                                                                />
                                                        </div>
                                                        <div
                                                            class="info-details
                                                            d-table-cell
                                                            align-middle">
                                                            <h5>Free &amp;
                                                                Fast
                                                                Shipping</h5>
                                                            <span>Free &amp;
                                                                Fast
                                                                Shipping
                                                                over 100+
                                                                countries
                                                                &amp;
                                                                regions.</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6
                                                    col-md-6 col-lg-6">
                                                    <div class="info-area
                                                        d-table">
                                                        <div
                                                            class="info-icon
                                                            d-table-cell
                                                            align-middle">
                                                            <img
                                                                class="img-fluid
                                                                blur-up
                                                                lazyload"
                                                                src="views/images/icons/safe-payment.png"
                                                                data-src="views/images/icons/safe-payment.png"
                                                                alt="image"
                                                                title="image"
                                                                />
                                                        </div>
                                                        <div
                                                            class="info-details
                                                            d-table-cell
                                                            align-middle">
                                                            <h5>Safe Payment</h5>
                                                            <span>Pay with
                                                                the
                                                                world's most
                                                                payment
                                                                methods</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6
                                                    col-md-6 col-lg-6">
                                                    <div class="info-area
                                                        d-table">
                                                        <div
                                                            class="info-icon
                                                            d-table-cell
                                                            align-middle">
                                                            <img
                                                                class="img-fluid
                                                                blur-up
                                                                lazyload"
                                                                src="views/images/icons/return-exchange.png"
                                                                data-src="views/images/icons/return-exchange.png"
                                                                alt="image"
                                                                title="image"
                                                                />
                                                        </div>
                                                        <div
                                                            class="info-details
                                                            d-table-cell
                                                            align-middle">
                                                            <h5>Return &amp;
                                                                Exchange</h5>
                                                            <span>30 days
                                                                online
                                                                purchase -
                                                                return &amp;
                                                                Exchange
                                                                Policy</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6
                                                    col-md-6 col-lg-6">
                                                    <div class="info-area
                                                        d-table">
                                                        <div
                                                            class="info-icon
                                                            d-table-cell
                                                            align-middle">
                                                            <img
                                                                class="img-fluid
                                                                blur-up
                                                                lazyload"
                                                                src="views/images/icons/support-24.png"
                                                                data-src="views/images/icons/support-24.png"
                                                                alt="image"
                                                                title="image"
                                                                />
                                                        </div>
                                                        <div
                                                            class="info-details
                                                            d-table-cell
                                                            align-middle">
                                                            <h5>Support 24/7</h5>
                                                            <span>We support
                                                                24/7 Have a
                                                                Question?
                                                                Call
                                                                Us <a
                                                                    href="tel:123-45-6789">123-45-6789</a></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Store Features -->
                                    </div>
                                    <!-- End Store Features -->
                                </div>


                                <!-- Start Product Social Media -->
                            </div>
                            <!-- End Product Info Details -->
                        </div>
                        <!-- End Single Product Detail -->

                        <!-- Start Product Detail Tabs -->
                        <div class="products-detail-tabs sections-spacing">
                            <div class="container">
                                <!-- Start Product Tabs -->
                                <ul class="drawer-tabs tabs text-center">
                                    <li class="active" data-tab="tab1">
                                        <a>Product Details</a>
                                    </li>
                                </ul>
                                <!-- End Product Tabs -->

                                <!-- Start Product Tabs Details -->
                                <div class="product-tabs responsiveTabs">
                                    <!-- Start Product Details Tab1 -->
                                    <h3 class="d_active tab-drawer-heading"
                                        data-tab="tab1"><a>Product Details</a>
                                    </h3>
                                    <div id="tab1"
                                        class="drawertab-content">
                                        <p>${product.description}</p>
                                    </div>
                                </div>
                                <!-- End Product Tabs Details -->
                            </div>
                        </div>
                        <!-- End Product Detail Tabs -->


                    <div class="related-product sections-spacing">
                    <div class="container">
                        <div class="section-header">
                            <h2>Related Product</h2>
                            <p>Browse the huge variety of our products</p>
                        </div>
                        <div id="relatedItems" class="row row-sp row-eq-height prcarousel">
                            
                        </div>
                    </div>
                </div>
                        <!-- End Related Product -->
                    </main>
                    <!-- End Main Content -->

                    <!-- Start Product Cart Added Popup -->
                    <div id="open-addtocart-popup"
                        class="addtocart-popup magnific-popup mfp-hide">
                        <div class="addtocart-inner-content
                            text-center">
                            <h4 id="adding_result"></h4>
                            <p class="pro-img"><img class="img-fluid
                                    blur-up lazyload"
                                    src="resource?image=${product.images.get(0).imageName}"
                                    data-src="resource?image=${product.images.get(0).imageName}"
                                    alt="image" title="image" /></p>
                            <p class="modal-prod-name mb-1 font-15">${product.name}</p>
                            <p id="cQuantity" class="font-13"></p>
                            <div class="addcart-total">
                                <div class="cart-total mt-2">
                                    Total: <b id="cTotalPrice" class="price"></b>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Product Cart Added Popup -->

                    <!-- Start Cart Drawer -->
                    <div class="minicart-wrapper">
                        <div id="cart_view" class="cart-drawer model
                            fade right show cart-drawer-right">
                        </div>
                    </div>
                    <!-- End Cart Drawer -->
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

                    <script src="views/js/ProductDetails.js"></script>

                    <script src="views/js/cart.js"></script>

                </body>
            </html>
