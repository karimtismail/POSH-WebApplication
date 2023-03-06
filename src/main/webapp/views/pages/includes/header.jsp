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
    <link rel="shortcut icon" href="../images/fevicon.png"/>

    <!-- *********** CSS Files *********** -->
    <!-- Plugin CSS -->
    <link rel="stylesheet" href="../style/plugins.css"/>
    <!-- Styles CSS -->
    <link rel="stylesheet" href="../style/styles.css"/>
    <link rel="stylesheet" href="../style/responsive.css"/>
</head>

<body class="template-index">
<!-- Start Page Loader -->
<div class="page-loading"></div>
<!-- End Page Loader -->

<!--  Start Main Wrapper -->
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

    <!-- Start Header Section -->
    <header class="header bg-white">
        <div class="container-fluid full-header">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Start Navigation -->
                <nav class="navigation navbar position-static navbar-expand-lg p-0 w-50">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="icon ti-menu"></span></button>
                    <div id="navbar-collapse" class="navbar-collapse collapse dual-nav">
                        <a href="#" class="closeNav-btn d-lg-none clearfix" id="closeNav" title="Close"><span
                                class="menu-close mr-2">Close</span><i class="ti-close" aria-hidden="true"></i></a>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="index.html">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="shop-list-left-sidebar.html">Products
                                    <span class="lbl new">New</span>
                                </a>

                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="about-us.html">About us</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- Start Navigation -->
                <!-- Start Logo -->
                <div class="navbar-brand logo mx-auto p-0 text-center">
                    <a href="index.html" class="logo-img"><img class="img-fluid" src="../images/logo/logo.png"
                                                               alt="logo" title="Posh Auto Parts"/></a>
                </div>
                <!-- End Logo -->
                <!-- Start Right Menu -->
                <div class="w-50 right-side">
                    <!-- Start Minicart -->
                    <div class="minicart float-right">
                        <a href="#" class="cart-btn" title="Cart" data-toggle="modal" data-target="#mycartdrawer">
                            <i class="icon ti-shopping-cart"></i>
                            <div class="cart-count">
                                <span id="count">4</span>
                            </div>
                        </a>
                    </div>
                    <!-- End Minicart -->
                    <!-- Start Setting Menu -->
                    <div class="setting-menu float-right">
                        <a href="#" class="setting-toggle" title="My Account">
                            <i class="icon ti-settings"></i>
                        </a>
                        <div class="settinglinks" style="display:none">
                            <!-- Menu Links -->
                            <div class="my-links">
                                <h4>My Account</h4>
                                <ul class="p-0 m-0">
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="register.html">Register</a></li>
                                    <li><a href="wishlist.html">Wishlist</a></li>
                                </ul>
                            </div>
                            <!-- Emd Menu Links -->
                        </div>
                    </div>
                    <!-- End Setting Menu -->
                    <!-- Start Search Box -->
                    <div class="search-box float-right">
                        <a href="#" title="Search" class="search-open search-toggle" data-toggle="modal"
                           data-target="#searchform">
                            <i class="icon ti-search"></i>
                        </a>
                    </div>
                    <!-- End Search Show -->
                </div>
                <!-- End Right Menu -->
            </div>
        </div>
    </header>
    <!-- End Header Section -->
</div>