<!-- Start Main Content -->
<main class="main-content">
    <!-- Start Products -->
    <div class="product-view-items product-grid col-12 col-sm-12 col-lg-9 sidebar-right" style="max-width: 100%">
        <div style="text-align: center">
            <h2>Dashboard</h2>
        </div>
        <!-- Start Products Grid -->
        <div id="allProducts" class="row row-sp row-eq-height">
            <div id="firstProduct" class="firstProduct col-sp col-6 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                <%@include file="product.jsp" %>
            </div>

        </div>
    </div>

    <!-- Start Pagination -->
    <ul id="pagination" class="pagination modal-5">
        <li><a class="prev fa fa-arrow-left"> </a></li>
        <li><a onclick="loadPageProducts(this.text + 'p')" class="active">1</a></li>
        <li id="nextPage"><a class="next fa fa-arrow-right"></a></li>
    </ul>
    <br>

    <!-- End Pagination -->
    <!-- End Products Grid -->

</main>
<%@include file="popups.jsp" %>
<div class="overlay"></div>

