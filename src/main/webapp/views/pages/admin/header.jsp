<!-- Start Header Section -->
<header class="header bg-white  header-sticky fadeInDown">
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
                        <li class="nav-item">
                            <a class="nav-link" onclick="goToHome()">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" onclick="goToUsers()">Clients</a>
                        </li>
                        <li class="nav-item" id="add-product-btn">
                            <a class="nav-link" onclick="openAddPopup()">Add Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/posh/logout_admin">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
<!-- End Header Section -->
