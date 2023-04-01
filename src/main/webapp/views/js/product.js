var page = 1;
var currentCategory = "ALL";
var v = document.getElementById("product_list");
var popular_products_view = document.getElementById("popular_products");

var startPrice = 0;
var endPrice = 10000;

function loadMoreProducts() {
    console.log("loadMoreProducts")
    loadProducts(currentCategory);
}

function loadProducts(category) {
    loadPopularProducts();

    if (currentCategory != category) {
        //start from page 1
        page = 1;
        //Clear List
        v.innerHTML = "";
        //change current category
        currentCategory = category;
        console.log("changepage = " + page)
    }
    updatePrice()
    $.get(`productList?category=${category}&startPrice=${startPrice}&endPrice=${endPrice}&page=${page}&timeStamp=${new Date().getTime()}`, ajaxCallBack);
    page++;
}

function updatePrice(){
    let price = document.getElementById("price_result").innerHTML.split('-')
    startPrice = price[0].replace('$','').replace(' ','')
    endPrice = price[1].replace('$','').replace(' ','')
}

function filterByPrice() {
    console.log("filterByPrice");
    v.innerHTML = ""
    page = 1;
    loadMoreProducts()
}

function ajaxCallBack(responseTxt, statusTxt, xhr) {
    if (statusTxt == "success") {
            v.innerHTML += responseTxt
    }
}

function loadPopularProducts() {
    $.get(`popular?timeStamp=${new Date().getTime()}`, popularCallBack);
}

function popularCallBack(responseTxt, statusTxt, xhr) {
    if (statusTxt == "success") {
        popular_products_view.innerHTML = responseTxt;
    }
}