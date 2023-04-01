<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content=" "/>
    <!-- Title -->
    <title>My Account - Posh Auto Parts eCommerce Bootstrap 4 Html Template</title>
    <!-- Favicon  -->
    <link rel="shortcut icon" href="views/images/fevicon.png"/>

    <!-- *********** CSS Files *********** -->
    <!-- Plugin CSS -->
    <link rel="stylesheet" href="views/style/plugins.css"/>
    <!-- Styles CSS -->
    <link rel="stylesheet" href="views/style/styles.css"/>
    <link rel="stylesheet" href="views/style/responsive.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.min.css">
</head>

<body class="template-my-account account-page">
<!-- Start Page Loader -->
<div class="page-loading"></div>
<!-- End Page Loader -->

<!--  Start Main Wrapper -->
<div class="main-wrapper cart-drawer-push">
    <!-- Start Promotional Bar Section -->
    <div class="promotional-bar border-0 rounded-0 d-flex align-items-center alert alert-warning fade show"
         role="alert">
        <div class="container-fluid full-promotional-bar">
            <span>Shop with discount 50%. Hurry Up! <a href="${pageContext.request.contextPath}/products">Shop Now</a></span>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><i class="ti-close"></i>
            </button>
        </div>
    </div>
    <!-- End Promotional Bar Section -->

    <%@include file="includes/header.jsp" %>

    <!-- Start Main Content -->
    <main class="main-content">
        <!-- Start Breadcrumb -->
        <div class="breadcrumbs text-center">
            <div class="container">
                <h1>My Account</h1>
                <ul class="breadcrumb bg-transparent m-0 p-0 justify-content-center">
                    <li class="breadcrumb-item"><a href="index.html" title="Home">Home</a></li>
                    <li class="breadcrumb-item active">My Account</li>
                </ul>
            </div>
        </div>
        <!-- End Breadcrumb -->

        <!-- Start My Account -->
        <div class="my-account-content">
            <div class="container">
                <div class="account-upper-info">
                    <div class="row align-items-center justify-content-center row-eq-height no-gutters">
                        <div class="info-item col-12 col-sm-12 col-md-3 col-lg-3">
                            <p class="mb-1">Hello <strong>${user.username}</strong></p>
                            <p class="mb-0">(not <strong>${user.username}</strong>? <a class="link-color"
                                                                                       href="/posh/logout">Log out</a>)
                            </p>
                        </div>
                        <div class="info-item col-12 col-sm-12 col-md-4 col-lg-4">
                            <p class="mb-1">Need Assistance? Customer service at.</p>
                            <p class="mb-0"><a href="mailto:admin@posh.com">admin@posh.com</a></p>
                        </div>
                        <div class="info-item col-12 col-sm-12 col-md-3 col-lg-3">
                            <p class="mb-1">E-mail them at </p>
                            <p class="mb-0"><a href="mailto:support@posh.com">support@posh.com</a></p>
                        </div>
                        <div class="info-item col-12 col-sm-12 col-md-2 col-lg-2 text-md-center">
                            <a href="cart.html" class="view-cart link-color">View Cart</a>
                        </div>
                    </div>
                </div>

                <div class="account-inner-info">
                    <div class="row">
                        <!-- Start My Account Nav -->
                        <div class="account-nav mb-5 mb-sm-0 col-12 col-sm-3 col-md-3">
                            <div class="nav flex-row flex-sm-nowrap flex-sm-column nav-pills" id="v-pills-tab"
                                 role="tablist">
                                <a class="nav-link active" id="my-account-home-tab" data-toggle="pill"
                                   href="#my-account-home" role="tab" aria-controls="my-account-home"
                                   aria-selected="true">Dashboard</a>
                                <a onclick = "loadOrders();" class="nav-link" id="my-account-order-tab" data-toggle="pill"
                                   href="#my-account-order" role="tab" aria-controls="my-account-order"
                                   aria-selected="false">Orders</a>
                                <!-- <a class="nav-link" id="my-account-address-tab" data-toggle="pill" href="#my-account-address" role="tab" aria-controls="my-account-address" aria-selected="false">Addresses</a> -->
                                <a class="nav-link" id="my-account-details-tab" data-toggle="pill"
                                   href="#my-account-details" role="tab" aria-controls="my-account-details"
                                   aria-selected="false">Account Details</a>
                                <a class="nav-link" id="change-pasword-tab" data-toggle="pill"
                                   href="#change-password-page" role="tab" aria-controls="change-password-page"
                                   aria-selected="false">Change Password</a>
                                <a class="nav-link" href="/posh/logout">Logout</a>
                            </div>
                        </div>
                        <!-- End My Account Nav -->

                        <!-- Start My Account Details -->
                        <div class="account-details col-12 col-sm-9 col-md-9">
                            <div class="tab-content" id="account-tabContent">
                                <!-- Start Dashboard -->
                                <div class="dashboard tab-pane fade show active" id="my-account-home" role="tabpanel"
                                     aria-labelledby="my-account-home-tab">
                                    <div class="tab-pane fade active show" id="dashboard">
                                        <h3>Dashboard </h3>
                                        <p>From your account dashboard. you can easily check &amp; view your <a
                                                class="link-color" href="">recent orders</a>, manage your <a
                                                class="link-color" href="">shipping and billing addresses</a> and <a
                                                href="" class="link-color">edit your password and account details</a>.
                                        </p>
                                    </div>
                                </div>
                                <!-- End Dashboard -->

                                <!-- Start Orders -->
                                <div class="tab-pane fade" id="my-account-order" role="tabpanel"
                                     aria-labelledby="my-account-order-tab">
                                    <div class="tab-pane fade active show" id="orders">
                                        <h3>Orders</h3>
                                        <div id ="orderList" class="order-table table-responsive">

                                        </div>
                                    </div>
                                </div>
                                <!-- End Orders -->

                                <!-- Start Account Details -->
                                <div class="tab-pane fade" id="my-account-details" role="tabpanel"
                                     aria-labelledby="my-account-details-tab">
                                    <h3>Account Details</h3>
                                    <form action="profile" id="editProfileForm"
                                          class="save-register-form needs-validation">
                                        <div class="row">
                                            <c:choose>
                                                <c:when test="${user.gender == 'male'}">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               value="male" checked disabled/>
                                                        <label class="form-check-label mb-0 ml-1" for="mr">Mr.</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               value="female" disabled/>
                                                        <label class="form-check-label mb-0 ml-1" for="mrs">Mrs.</label>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="mr" value="male" disabled/>
                                                        <label class="form-check-label mb-0 ml-1" for="mr">Mr.</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="gender"
                                                               id="mrs" value="female" checked disabled/>
                                                        <label class="form-check-label mb-0 ml-1" for="mrs">Mrs.</label>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="form-group col-md-12">
                                                <label>Your Name *</label>
                                                <input type="text" name="username" id="username" class="form-control"
                                                       value="${user.username}" placeholder=""/>
                                                <div class="invalid-feedback" id="name_error"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Email Address *</label>
                                                <input type="email" id="email" name="email" class="form-control"
                                                       value="${user.email}" disabled/>
                                                <div class="invalid-feedback" id="email_error"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Phone Number *</label>
                                                <input type="text" name="phoneNum" id="phone" class="form-control"
                                                       value="${user.phoneNum}"/>
                                                <div class="invalid-feedback" id="phone_error"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Address *</label>
                                                <input name="address" id="address" type="text" class="form-control"
                                                       value="${user.address}"/>
                                                <div class="invalid-feedback" id="address_error"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Credit Limit *</label>
                                                <input name="creditLimit" id="creditLimit" type="text"
                                                       class="form-control"
                                                       value="${user.creditLimit}"/>
                                                <div class="invalid-feedback" id="creditLimit_error"></div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="account-save mt-1 mt-sm-3">
                                                    <input id="saveChangesButton" type="button"
                                                           class="btn btn-secondary" value="Save Changes">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- End Account Details -->
                                <!-- Start Address -->
                                <div class="tab-pane fade" id="change-password-page" role="tabpanel"
                                     aria-labelledby="change-password-page">
                                    <h3>Change Password</h3>
                                    <div class="row">
                                        <form id="changePasswordForm" action="change-password"
                                              class="password-change-form needs-validation" method="post">
                                            <div class="form-group">
                                                <label>Current Password *</label>
                                                <input type="password" id="currentPassword" name="currentPassword"
                                                       class="form-control" placeholder="" required/>
                                                <div class="invalid-feedback">Please enter your current password.</div>
                                            </div>
                                            <div class="form-group">
                                                <label>New Password *</label>
                                                <input type="password" id="newPassword" name="newPassword"
                                                       class="form-control" placeholder="" required/>
                                                <small class="form-text text-muted">Your password must be 8-20
                                                    characters long, contain letters and numbers, and must not contain
                                                    spaces, special characters.</small>
                                                <div class="invalid-feedback">Please enter your new password.</div>
                                            </div>
                                            <div class="form-group">
                                                <label>Confirm Password *</label>
                                                <input type="password" id="confirmPassword" name="confirmPassword"
                                                       class="form-control" placeholder="" required/>
                                                <small class="form-text small text-muted">To confirm, type the new
                                                    password again.</small>
                                                <div class="invalid-feedback">Please enter your new password again.
                                                </div>
                                            </div>
                                            <div class="change-password-btn mt-5">
                                                <button id="changePasswordButton" type="submit"
                                                        class="btn btn-primary btn-block">Change Password
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- End Address -->
                            </div>
                        </div>
                        <!-- End My Account Details -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End My Account -->
    </main>
    <!-- End Main Content -->

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
<!--  End Main Wrapper -->

<!-- ******** JS Files ******** -->
<!-- Plugin JS -->
<script src="views/js/plugins.js"></script>

<!-- com.posh.App.Main JS -->
<script src="views/js/main.js"></script>
<script src="views/js/editProfile.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
        integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.js"
        integrity="sha512-n9HW9lIIxL1++t4PqOLyw1sTcqZhvaLBKQOBEwKR3lntF4nVULdfYrD+lklcoM8i0rqEeN522u7d4v7NhvdUWg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"
        integrity="sha512-6S5LYNn3ZJCIm0f9L6BCerqFlQ4f5MwNKq+EthDXabtaJvg3TuFLhpno9pcm+5Ynm6jdA9xfpQoMz2fcjVMk9g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"
        integrity="sha512-IFD8s8Ds5M/7XsAQXNXtHVdiA8EnBR6bZhy0R+Y7fruej9fNPkrZ6+0/dP8yfRU1u2x9De4WYGCNvoaIhmhnpg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.3/dist/sweetalert2.all.min.js"></script>
<!-- Validation Form JS -->
<script src="views/js/change-password.js"></script>
<script src="views/js/order.js"></script>

</body>
</html>

