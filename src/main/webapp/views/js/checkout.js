    const billingAddressCheckBox = document.getElementById("billingAddressCheckBox");
    const selectedCity  = document.getElementById("selectedCity");
    const addressTextArea = document.getElementById("addressTextArea");
    const orderNoteTextArea  = document.getElementById("orderNote");
    const imageLabel  = document.getElementById("imageName");
    const productName  = document.getElementById("name");

function checkOutSingleproduct(id, price, quantity) {
    //check if user is logged or no
    //Get Quantity
    //Send RequestTo Add the product into user cart
        let citytext = selectedCity.options[selectedCity.selectedIndex].text;
        let addresstest = addressTextArea.value;
        let notetext = orderNoteTextArea.value;

       var data = {
                    id: id,
                    price: price,
                    quantity: quantity,
                    image: imageLabel.innerHTML,
                    name: productName.innerHTML,
                    city: citytext,
                    address: addresstest,
                    note: notetext,
                    billingAddress: billingAddressCheckBox.checked
        }

        console.log(data);

    console.log(`${id} + ${price} + ${quantity}`)

    $.ajax({
      type: 'POST',
      url: "checkoutSingleProduct",
      data: data,
      success: singlePResponseCallBack,
      async:false
    });
}

function checkOutCart() {

    if(billingAddressCheckBox.checked){
        let citytext = selectedCity.options[selectedCity.selectedIndex].text;
        let addresstest = addressTextArea.innerHTML;
        let notetext = orderNoteTextArea.innerHTML;
        console.log(`city : ${citytext}, address : ${addresstest}, note: ${notetext}`);
    }

    $.post("checkoutCartProducts", singlePResponseCallBack);
}

function singlePResponseCallBack(responseTxt, statusTxt, xhr) {
    console.log(responseTxt)
    if (statusTxt == "success") {
        console.log("Data: " + responseTxt + "\nStatus: " + statusTxt);
          document.open();
          document.write(responseTxt);
          document.close();
    }
}

function doPost(data, url) {  
    let xhr = new XMLHttpRequest();
    xhr.open("POST", url);
    xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4) {
        console.log(xhr.status);
        console.log(xhr.responseText);
      }};

    console.log(JSON.stringify(data));
    xhr.send(JSON.stringify(data));
}

