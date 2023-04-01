var v = document.getElementById("relatedItems");
function loadRelatedProducts(category) {
    // We need to call ajax Get to get relatedProducts
    // Depend on category, price, brand, Vendor
    $.get(`productList?category=${findCategoryName(category)}&startPrice=0&endPrice=20000&page=1&timeStamp=${new Date().getTime()}`, ajaxCallBack);
}

function findCategoryName(category) {
    console.log("categ" + category)
    if (category == 1)
        return "OIL";
    else if (category == 2)
        return "LIQUID";
    else if (category == 3)
        return "PLUG";
    else if (category == 4)
        return "BATTERY";
    else
        return "TIER";
}

function ajaxCallBack(responseTxt, statusTxt, xhr) {
    if (statusTxt == "success") {
        v.innerHTML = responseTxt
    }
}

function payNow(pid, pname, pimage, price) {
    //Get Quantity
    let q = document.getElementById("quantity_field").value;
    //And save current item to local storage
    var json = ``;
    //Call servlet
    $.get(`checkoutSingleProduct?id=${pid}&name=${pname}&price=${price}&quantity=${q}&image=${pimage}&timeStamp=${new Date().getTime()}`
        , singleResponseCallBack);
}

function singleResponseCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    if (statusTxt == "success") {
        console.log("safasfsf")
    }
}
