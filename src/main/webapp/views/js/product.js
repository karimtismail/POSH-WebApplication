var page = 1;

function loadProducts(category) {
    var jsonData = JSON.stringify({ category: category });
    console.log(new Date().getTime())
    $.get(`product?category=${category}&page=${page++}&timeStamp=${new Date().getTime()}`, ajaxCallBack);
}

function ajaxCallBack(responseTxt, statusTxt, xhr) {
    if (statusTxt == "success") {
        console.log(responseTxt)
        let v = document.getElementById("product_list");
        v.innerHTML = ""
        responseTxt.forEach(product => {
            v.innerHTML += addProduct(product)
        });
    }
}


function addProduct(product) {
    let item = "<div class=\"col-sp col-6 col-sm-4 col-md-4 col-lg-4 col-xl-4\"> <div class=\"product-item\"> <div class=\"product-image-action\"> <div class=\"product-label\"><span class=\"label new\">New</span> <span class=\"label sale\">Sale</span> </div>"
    item += `<div class="product-image">`
    item += `<a href="product-details.html">`
    item += `<img class="img-fluid blur-up lazyload" src="resource?image=${product.product_image}" data-src="resource?image=${product.product_image}" alt="image" title="image" /></a></div>`
    item += `<div class="product-action">`
    item += `<ul>
    <li class="actions-addcart" data-toggle="tooltip" data-placement="top" title="add to cart"><a href="#open-addtocart-popup" class="btn open-addtocart-popup"><i class="icon ti-shopping-cart"></i></a></li>
    <li class="actions-quickview" data-toggle="tooltip" data-placement="top" title="quick view"><a href="#open-quickview-popup" class="btn open-quickview-popup"><i class="icon ti-zoom-in"></i></a></li></ul></div></div>`
    item += `   <div class="product-details">
    <h3 class="product-title"><a href="product-details.html">${product.product_name}</a></h3> <h4 class="product-vendor">${product.product_vendor}</h4><div class="product-starrating">
        <i class="spr-icon fa fa-star"></i>
        <i class="spr-icon fa fa-star"></i>
        <i class="spr-icon fa fa-star"></i>
        <i class="spr-icon fa fa-star"></i>
        <i class="spr-icon fa fa-star-o"></i>
    </div>
    <div class="product-price">
        <span class="compare-price">$${product.price - 10}</span>
        <span class="sale-price">$${product.price}</span>
    </div>
</div>
</div>
</div>`
    return item;
}



