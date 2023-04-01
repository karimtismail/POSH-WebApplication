<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="user" scope="session" value="${sessionScope.loggedInuser}" />

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
                            <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/products">Products
                                <span class="lbl new">New</span>
                            </a>

                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="${pageContext.request.contextPath}/aboutus">About us</a>
                        </li>
                        <c:if test="${user != null}">
                            <li style="border-left: 2px solid #f76d2b; height: 50px; margin-top: 19px; margin-right: 15px"></li>
                            <c:if test="${user.gender.equalsIgnoreCase('male')}">
                                <li style="padding-top: 20px">
                                    <a class="nav-link" href="/posh/profile">
                                        <img src="views/images/others/male.png" alt="male image" width="40"
                                             height="40" style="border-radius: 50%">
                                        ${user.username}
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${user.gender.equalsIgnoreCase('female')}">
                                <li style="padding-top: 20px">
                                    <a href="/posh/profile">
                                        <img src="views/images/others/female.png"
                                             alt="female image" width="40"
                                             height="40" style="border-radius: 50%">
                                            ${user.username}
                                    </a>
                                </li>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </nav>
            <!-- Start Navigation -->
            <!-- Start Logo -->
            <div class="navbar-brand logo mx-auto p-0 text-center">
                <a href="${pageContext.request.contextPath}/home" class="logo-img"><img class="img-fluid"
                                                                                        src="views/images/logo/logo.png"
                                                                                        alt="logo"
                                                                                        title="Posh Auto Parts"/></a>
            </div>
            <!-- End Logo -->
            <!-- Start Right Menu -->
            <div class="w-50 right-side">
                <!-- Start Minicart -->
                <div class="minicart float-right">
                    <a onclick="loadCartItems(1)" href="#" class="cart-btn" title="Cart" data-toggle="modal" data-target="#mycartdrawer">
                        <i class="icon ti-shopping-cart"></i>
                        <div class="cart-count">
                            <span id="count">4</span>
                        </div>
                    </a>
                </div>
                <!-- End Minicart -->
                <!-- Start Setting Menu -->
                <c:if test="${user == null}">
                    <div class="setting-menu float-right">
                        <a href="#" class="setting-toggle" title="My Account">
                            <i class="icon ti-settings"></i>
                        </a>
                        <div class="settinglinks" style="display:none">
                            <!-- Menu Links -->
                            <div class="my-links">
                                <h4>My Account</h4>
                                <ul class="p-0 m-0">
                                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                                    <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                                </ul>
                            </div>
                            <!-- Emd Menu Links -->
                        </div>
                    </div>
                </c:if>
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
