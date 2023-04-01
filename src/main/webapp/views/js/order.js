
function loadOrders() {
    $.get(`orders`
        , orderResponseCallBack);
}

function orderResponseCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    if (statusTxt == "success") {
        let orderView = document.getElementById("orderList");
        orderView.innerHTML = responseTxt;
    }
}


function updateOrderStatus(id, status) {
    $.post("UpdateOrder",
        {
            order_id: id,
            orderStatus: status
        }
        , UpdateOrderResponseCallBack);

        
        if(status == 0){
            let containerId = `div${id}`
            let container = document.getElementById(containerId)
            container.remove()
        }
}

function UpdateOrderResponseCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    if (statusTxt == "success") {
        console.log(responseTxt);
        
    }
}

function remove(el) {
    var element = el;
    element.remove();
  }
