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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
    <style>
        label.error {
            color: red;
        }
        .email-error {
            color: red;
        }

    </style>
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
        <!-- Start Breadcrumb -->
        <div class="breadcrumbs text-center">
            <div class="container">
                <h1>Create An Account</h1>
                <ul class="breadcrumb bg-transparent m-0 p-0 justify-content-center">
                    <li class="breadcrumb-item"><a href="index.jsp" title="Home">Home</a></li>
                    <li class="breadcrumb-item active">Create an Account</li>
                </ul>
            </div>
        </div>
        <!-- End Breadcrumb -->

        <!-- Start Register Account -->
        <div class="create-account">
            <div class="container">
                <div class="row row-sp">
                    <div class="col-sp col-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="page-title text-center">
                            <p class="subtitle mb-0">Creating an account will save you time at checkout and allow you to
                                access <br/>
                                your order status and history.
                            </p>
                        </div>
                        <!-- action="controller/RegistrationController" -->
                        <form action="register" method="POST"
                              class="register-form needs-validation" novalidate id="register-form">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="username">Full Name *</label>
                                    <input type="text" class="form-control" placeholder="" name="username"
                                           id="username"
                                           required/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email Address *</label>
                                    <input type="email" class="form-control" placeholder="" name="email" id="email"
                                           required/>
                                    <span id="email-error" class="error-message"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="dateOfBirth">Date Of Birth *</label>
                                    <input type="date" class="form-control" placeholder="" name="dateOfBirth"
                                           id="dateOfBirth"
                                           required/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="password">Password *</label>
                                    <input type="password" class="form-control" placeholder="" name="password"
                                           id="password"
                                           required/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="confirmPassword">Confirm Password *</label>
                                    <input type="password" class="form-control" placeholder="" name="confirmPassword"
                                           id="confirmPassword"
                                           required/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phoneNum">Phone Number *</label>
                                    <input type="tel" class="form-control" placeholder="" name="phoneNum"
                                           id="phoneNum" required/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="gender">Gender *</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address">Address *</label>
                                    <input type="text" class="form-control" name="address" id="address" placeholder=""
                                           required/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="city">City *</label>
                                    <select class="form-control" id="city" name="city">
                                        <option value="cairo">Cairo</option>
                                        <option value="alexandria">Alexandria</option>
                                        <option value="giza">Giza</option>
                                        <option value="qalyubia">Qalyubia</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="creditLimit">Credit Limit *</label>
                                    <input type="text" class="form-control" placeholder="" name="creditLimit"
                                           id="creditLimit"
                                           required/>
                                </div>
                            </div>
                            <div class="form-group button-action mt-1 mt-sm-5 clearfix text-center">
                                <input id="registerFormHandler" type="submit" value="Submit"
                                       class="account-create btn btn-secondary"/>
                            </div>
                            <input type="hidden" name="action" value="register">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Register Account -->
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
                        <input type="text" class="form-control" placeholder="Search Products...">
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
                <ul class="cart-lists clearfix">+
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
<!-- End com.posh.App.Main Wrapper -->

<!-- ******** JS Files ******** -->
<!-- Plugin JS -->
<script src="views/js/plugins.js"></script>

<!-- com.posh.App.Main JS -->
<script src="views/js/main.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script><script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.js" integrity="sha512-n9HW9lIIxL1++t4PqOLyw1sTcqZhvaLBKQOBEwKR3lntF4nVULdfYrD+lklcoM8i0rqEeN522u7d4v7NhvdUWg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js" integrity="sha512-6S5LYNn3ZJCIm0f9L6BCerqFlQ4f5MwNKq+EthDXabtaJvg3TuFLhpno9pcm+5Ynm6jdA9xfpQoMz2fcjVMk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js" integrity="sha512-IFD8s8Ds5M/7XsAQXNXtHVdiA8EnBR6bZhy0R+Y7fruej9fNPkrZ6+0/dP8yfRU1u2x9De4WYGCNvoaIhmhnpg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
<!-- Validation Form JS -->
<script src="views/js/signupValidation.js"></script>
</body>
</html>

