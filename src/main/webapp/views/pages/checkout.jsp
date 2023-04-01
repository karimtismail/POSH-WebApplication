<jsp:useBean id="checkoutResponse" type="com.posh.dtos.orderdtos.OrderResponse"
scope="request" />
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content=" " />
        <!-- Title -->
        <title>Checkout Style1 - Posh Auto Parts eCommerce Bootstrap 4 Html Template</title>
        <!-- Favicon  -->
        <link rel="shortcut icon" href="views/images/fevicon.png" />

        <!-- *********** CSS Files *********** -->
        <!-- Plugin CSS -->
        <link rel="stylesheet" href="views/style/plugins.css" />
        <!-- Styles CSS -->
        <link rel="stylesheet" href="views/style/styles.css" />
        <link rel="stylesheet" href="views/style/responsive.css" />       
    </head>

    <body class="template-checkout">
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
                        <h1>checkout Style1</h1>
                        <ul class="breadcrumb bg-transparent m-0 p-0 justify-content-center">
                            <li class="breadcrumb-item"><a href="index.html" title="Home">Home</a></li>
                            <li class="breadcrumb-item active">checkout</li>
                        </ul>
                    </div>
                </div>
                <!-- End Breadcrumb -->

                <!-- Start checkout -->
                <div class="checkout-content">
                    <div class="container">
                        <!-- Start Checkout Content -->
                        <div class="row">
                            <!-- Start Checkout Form -->
                            <div class="checkout-form col-12 col-sm-12 col-lg-8 mb-5 mb-lg-0 sidebar-left">
                                <!-- Start Shipping Form -->
                                <div class="shiping-form needs-validation" novalidate>
                                    <div class="card rounded-0">
                                        <div class="card-header rounded-0">Shipping Address</div>
                                        <div class="card-body">
                                            
                                            <!-- Start Billing Form -->
                                            <div class="billing-content" id="billing">
                                                <div class="card border-0 rounded-0">
                                                    <div class="d-inline-block border-0 rounded-0 bg-white mb-3" id="billingOne1">
                                                        <div class="form-check d-inline-block" role="tablist" data-toggle="collapse" data-target="#billingOne" aria-expanded="true" aria-controls="billingOne">
                                                            <input id ="billingAddressCheckBox" class="form-check-input" type="checkbox" id="billingcheck1" />
                                                            <label class="form-check-label ml-3" for="billingcheck1">Billing Different Address?</label>
                                                        </div>
                                                    </div>
                                                    <div id="billingOne" class="collapse" aria-labelledby="billingOne" data-parent="#billing">
                                                        <div class="card-body p-0 text-muted">

                                                            <div class="row form-group mb-0">
                                                                <div class="col-12 col-sm-12 col-md-12 mb-4">
                                                                    <label>Address: *</label>
                                                                    <textarea id = "addressTextArea" class="form-control" rows="3" placeholder="" required></textarea>
                                                                </div>
                                                            </div>

                                                            <div class="row form-group mb-0">
                                                                <div class="col-12 col-sm-6 col-md-6 mb-4">
                                                                    <label>City: *</label>
                                                                    <select id = "selectedCity" class="select2 js-city form-control" name="city" required>
                                                                        <option value="cairo">Cairo</option>
                                                                        <option value="alexandria">Alexandria</option>
                                                                        <option value="giza">Giza</option>
                                                                        <option value="qalyubia">Qalyubia</option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Billing Form -->

                                            <div class="row form-group mb-0">
                                                <div class="col-12 col-sm-12 col-md-12">
                                                    <label>Order Notes:</label>
                                                    <textarea id ="orderNote" class="form-control" rows="3" placeholder=""></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Shipping Form -->
                            </div>
                            <!-- End Checkout Form -->

                            <!-- Start Cart Order -->
                            <div class="checkout-order col-12 col-sm-12 col-lg-4 sidebar sidebar-right">
                                <h3>Review Order</h3>
                                <!-- Start Order Cart Table -->
                                <div class="table-content table-responsive mb-4">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="text-center"><b>Product</b></th>
                                                <th class="text-left"></th>
                                                <th class="text-center"><b>Price</b></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="prod"
                                            items="${checkoutResponse.products}">
                                            <label id = "imageName" hidden> ${prod.image}</label>
                                            <tr>
                                                <td class="pro-img text-center"><a ><img class="img-fluid blur-up lazyload" src="resource?image=${prod.image}" data-src="resource?image=${prod.image}" alt="image" title="image" width="60" /></a></td>
                                                <td class="pro-del text-left">
                                                    <p id = "name" class="mb-1 pro-name">${prod.name}</p>
                                                    <p class="mb-1">Quantity: ${prod.quantity}</p>
                                                </td>
                                                <td class="pro-price text-center">${prod.price} $</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End Order Cart Table -->

                                <!-- Start Payment Method -->
                                <div class="payment-method accordion" id="payment-method">
                                    <!-- Start Cash on delivery -->
                                    <div class="card border-0 rounded-0 mb-3">
                                        <div class="card-header border-0 rounded-0 p-0 bg-white" id="payment-One1">
                                            <div class="form-check" role="tablist" data-toggle="collapse" data-target="#paymentOne" aria-expanded="true" aria-controls="paymentOne">
                                                <input class="form-check-input" type="radio" name="paymentRadio" id="paymentRadio1" checked />
                                                <label class="form-check-label w-100 ml-3" for="paymentRadio1">Cash on delivery</label>
                                            </div>
                                        </div>
                                        <div id="paymentOne" class="collapse show" aria-labelledby="paymentOne" data-parent="#payment-method">
                                            <div class="card-body p-0 text-muted font-13">Pay with cash upon delivery.</div>
                                        </div>
                                    </div>
                                    <!-- End Cash on delivery -->

                                    <!-- Start Bank payments -->
                                    <div class="card border-0 rounded-0 mb-3">
                                        <div class="card-header border-0 rounded-0 bg-white p-0" id="payment-One2">
                                            <div class="form-check" role="tablist" data-toggle="collapse" data-target="#paymentOne2" aria-expanded="false" aria-controls="paymentOne2">
                                                <input class="form-check-input" type="radio" name="paymentRadio" id="paymentRadio2" />
                                                <label class="form-check-label w-100 ml-3" for="paymentRadio2">Bank payments</label>
                                            </div>
                                        </div>
                                        <div id="paymentOne2" class="collapse" aria-labelledby="paymentOne2" data-parent="#payment-method">
                                            <div class="card-body p-0">
                                                <!-- Start Form Card CC Payment -->
                                                <div class="card-outline-secondary">
                                                    <div class="alert alert-info font-12">
                                                        CVC code is required.
                                                        <a class="close" data-dismiss="alert" href="#"><i class="ti-close"></i></a>
                                                    </div>
                                                    <form action="#" autocomplete="off" class="form needs-validation" novalidate>
                                                        <div class="form-group mb-4 mb-sm-3">
                                                            <label>Card Number</label> 
                                                            <input type="text" autocomplete="off" class="form-control" maxlength="20" required />
                                                            <div class="invalid-feedback">Please enter your card number.</div>
                                                        </div>
                                                        <div class="form-group row mb-0 mb-sm-3">
                                                            <label class="col-12 col-sm-12 col-md-12">Card Exp. Date</label>
                                                            <div class="col-12 col-sm-4 col-md-4 mb-4 mb-sm-0">
                                                                <select class="select2 form-control" name="cc-exp-mo" required>
                                                                    <option value="" disabled selected>Months</option>
                                                                    <option value="01">01</option>
                                                                    <option value="02">02</option>
                                                                    <option value="02">03</option>
                                                                    <option value="02">04</option>
                                                                    <option value="02">05</option>
                                                                    <option value="02">06</option>
                                                                    <option value="02">07</option>
                                                                    <option value="02">08</option>
                                                                    <option value="02">09</option>
                                                                    <option value="02">10</option>
                                                                    <option value="02">11</option>
                                                                    <option value="02">12</option>
                                                                </select>
                                                                <div class="invalid-feedback">Please select months.</div>
                                                            </div>
                                                            <div class="col-12 col-sm-4 col-md-4 mb-4 mb-sm-0">
                                                                <select class="select2 form-control w-100" name="cc-exp-yr" required>
                                                                    <option value="" disabled selected>Year</option>
                                                                    <option value="2019">2019</option>
                                                                    <option value="2018">2018</option>
                                                                    <option value="2017">2017</option>
                                                                    <option value="2016">2016</option>
                                                                    <option value="2015">2015</option>
                                                                    <option value="2014">2014</option>
                                                                    <option value="2013">2013</option>
                                                                    <option value="2012">2012</option>
                                                                    <option value="2011">2011</option>
                                                                    <option value="2010">2010</option>
                                                                    <option value="2009">2009</option>
                                                                    <option value="2008">2008</option>
                                                                    <option value="2007">2007</option>
                                                                    <option value="2006">2006</option>
                                                                    <option value="2005">2005</option>
                                                                </select>
                                                                <div class="invalid-feedback">Please select year.</div>
                                                            </div>
                                                            <div class="col-12 col-sm-4 col-md-4 mb-4 mb-sm-0">
                                                                <input type="text" autocomplete="off" class="form-control" maxlength="3" placeholder="CVC" title="Three digits on the back of your card" required />
                                                                <div class="invalid-feedback">Please enter your CVC.</div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-4 mb-sm-3">
                                                            <label>Amount</label>
                                                            <div class="input-group">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text">$</span>
                                                                </div>
                                                                <input type="text" class="form-control text-right" placeholder="32" aria-label="Amount (to the nearest dollar)" required />
                                                                <div class="invalid-feedback">Please enter amount.</div>
                                                                <div class="input-group-append">
                                                                    <span class="input-group-text">.00</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row mt-4">
                                                            <div class="col-12 col-sm-6 col-md-6 mb-4 mb-sm-0">
                                                                <button class="btn btn-secondary btn-lg btn-block" type="reset">Cancel</button>
                                                            </div>
                                                            <div class="col-12 col-sm-6 col-md-6">
                                                                <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <!-- End Form Card CC Payment -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Bank payments -->
                                </div>                                
                                <!-- End Payment Method -->

                                <p>Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.</p>

                                <div class="form-group mt-5">
                                    <c:if test="${checkoutResponse.operation eq 0}" >
                                        <button onclick="checkOutSingleproduct(`${checkoutResponse.products.get(0).id}`, `${checkoutResponse.products.get(0).price}`, `${checkoutResponse.products.get(0).quantity}`);" class="btn btn-primary btn-lg btn-block place-order-btn">Place order</button>
                                    </c:if>

                                    <c:if test="${checkoutResponse.operation eq 1}" >
                                        <button onclick = "checkOutCart();" class="btn btn-primary btn-lg btn-block place-order-btn">Place order</button>
                                    </c:if>                                
                                </div>
                            </div>
                            <!-- End Cart Order -->
                        </div>
                        <!-- End Checkout Content -->
                    </div>
                </div>
                <!-- End checkout -->
            </main>
            <!-- End Main Content -->

            <!-- Start Scroll Top -->
            <div id="scrollTop"><i class="ti-arrow-up"></i></div>
            <!-- End Scroll Top -->

            <!-- Overlay -->
            <div class="overlay"></div>
        </div>
        <!--  End Main Wrapper -->

        <!-- ******** JS Files ******** -->        
        <!-- Plugin JS -->	        
        <script src="views/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="views/js/main.js"></script>
        <script src="views/js/checkout.js"></script>

    </body>
</html>

