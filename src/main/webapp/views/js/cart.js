const quantity_input = document.getElementById("quantity_field");
const cQuantity = document.getElementById("cQuantity");
const cTotalPrice = document.getElementById("cTotalPrice");
const cResult = document.getElementById("adding_result");

function loadCartItems(user_id) {
    $.get(`viewCart?user_id=${user_id}&timeStamp=${new Date().getTime()}`, catCallBack);
}

function catCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    var c = document.getElementById("cart_view");
    if (statusTxt == "success") {
        c.innerHTML = responseTxt;
    }
}

function addProdToCart(product_id) {
    //check if user is logged or no
    //Get Quantity
    let quantity = quantity_input.value;
    console.log(quantity)
    //Send RequestTo Add the product into user cart
    $.post("addToCart",
        {
            product_id: product_id,
            user_id: 1,
            quantity: quantity
        }, addResponseCallBack);
}

function addResponseCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    if (statusTxt == "success") {
        var response = responseTxt.result;
        cQuantity.innerHTML = `Quantity : ${quantity_input.value}`
        cTotalPrice.innerHTML = "55$"
        cResult.innerHTML = response;
        console.log("Data: " + responseTxt + "\nStatus: " + statusTxt);
    }
}

function removeFromCart(product_id, price){
    $.post("removeCart",
    {
        product_id: product_id,
        user_id: 1
    }, removeResponseCallBack);

    let containerId = `cart${product_id}`
    let container = document.getElementById(containerId)
    container.remove()
    changeTotal(price)
}

function changeTotal(amount) {
    
}

function removeResponseCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    var c = document.getElementById("cart_view");
    if (statusTxt == "success") {
        console.log("Data: " + responseTxt + "\nStatus: " + statusTxt);
    }
}