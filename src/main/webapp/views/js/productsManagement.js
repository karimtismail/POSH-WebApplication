var quickView = document.getElementById("open-quickview-popup");
var editView = document.getElementById("open-edit-popup");
var deleteView = document.getElementById("open-delete-popup");
var addView = document.getElementById("open-add-popup");

var selectedProductIndexInCurrPageProductsList = 0;
var selectedProductIdToDelete =0;
var currentPageProducts;
var fromServer = true;
const productsPerPage = 12;
var productsCountInCurrentPage = 12;
var currPageNumber = 1;
var errorMsg;
var imageOne;

const addImgChooser = document.getElementById('add-product-image-chooser');
const editImgChooser = document.getElementById('edit-product-image-chooser');

sessionStorage.clear();

// $('window').beforeLoad = loadPageProducts(1);

addImgChooser.onchange = function (evt) {
        let imagesList = document.getElementById("add-image-div");
        for (let i = 0; i < imagesList.childNodes.length; i++) {
            if (imagesList.lastChild.id != "add-product-image")
                imagesList.removeChild(imagesList.lastChild);
        }
        if (addImgChooser.files && addImgChooser.files[0]) {
        imageOne = URL.createObjectURL(addImgChooser.files[0])
            for (let i = 0; i < addImgChooser.files.length && i < 5; i++) {
                let image = document.getElementById('add-product-image').cloneNode(true);
                image.id = " image" + i;
                image.style.display = "inline";
                document.getElementById("add-image-div").appendChild(image);
                image.src = URL.createObjectURL(addImgChooser.files[i]);
                image.onload = () => {
                    URL.revokeObjectURL(image.src)
                }
            }
        }
    }


editImgChooser.onchange = function (evt) {
    let imagesList = document.getElementById("edit-image-div");
    for (let i = 0; i < imagesList.childNodes.length; i++) {
        if (imagesList.lastChild.id != "edit-product-image")
            imagesList.removeChild(imagesList.lastChild);
    }
    if (editImgChooser.files && editImgChooser.files[0]) {
        for (let i = 0; i < editImgChooser.files.length && i < 5; i++) {
            let image = document.getElementById('edit-product-image').cloneNode(true);
            image.id = " image" + i;
            image.style.display = "inline";
            document.getElementById("edit-image-div").appendChild(image);
            image.src = URL.createObjectURL(editImgChooser.files[i]);
            image.onload = () => {
                URL.revokeObjectURL(image.src)
            }
        }
    }
}


//================================== LOAD PRODUCTS SECTION =================================
function loadPageProducts(pageNum) {
    if (pageNum[pageNum.length - 1] == 'p') {
        currPageNumber = pageNum.slice(0, -1);
        fromServer = false
    } else {
        currPageNumber = pageNum;
    }
    // console.log(sessionStorage.getItem("page" + currPageNumber))
    clearProductsList();
    if (sessionStorage.getItem("page" + currPageNumber) == null) {
        let jsonData = {category: "ALL", pageNum: currPageNumber}
        $.ajax({
            url: 'product', //servlet url
            type: 'GET', //servlet request type
            contentType: 'application/json', //For input type
            data: jsonData, //input data
            dataType: 'json', //For output type
            success: viewProducts
        });
    } else {
        goToPageFromStorage()
    }
}


function viewProducts(event) {
console.log(event)
    sessionStorage.setItem("page" + currPageNumber, JSON.stringify(event))
    currentPageProducts = event;
    productsCountInCurrentPage = currentPageProducts.length
    displayProducts();
    fromServer = false;
}


function addPage() {
    for (let i = 2; i <= currentPageProducts[0].pageNumber; i++) {
        document.getElementById("nextPage").insertAdjacentHTML("beforebegin", '<li><a id="pageOne" onclick="loadPageProducts(this.text+\'p\')" >' + i + '</a></li>')
    }
}

function displayProducts() {
    if (fromServer)
        addPage();
    for (let i = 0; i < productsCountInCurrentPage; i++) {
        let product = document.getElementById("firstProduct").cloneNode(true);
        product.id = currentPageProducts[i].productId;

let img = currentPageProducts[i].images[0].imageName
product.querySelector("#prod-img").src =  "resource?image="+ img;
        let productDetails = product.childNodes.item(1).childNodes.item(3).childNodes;
        productDetails.item(1).textContent = currentPageProducts[i].name;
        productDetails.item(3).textContent = currentPageProducts[i].vendor;
        productDetails.item(5).textContent = "$" + currentPageProducts[i].price;
        product.style.display = "inline"
        document.getElementById("allProducts").insertAdjacentElement("afterbegin", product);
    }
}

function clearProductsList() {
    let productsList = document.getElementById("allProducts");
    for (let i = 0; i < productsCountInCurrentPage; i++) {
        if (productsList.firstChild.id != "firstProduct")
            productsList.removeChild(productsList.firstChild);
    }
}

function goToPageFromStorage() {
    currentPageProducts = JSON.parse(sessionStorage.getItem("page" + currPageNumber))
    productsCountInCurrentPage = currentPageProducts.length
    displayProducts();
}


//================================DELETE PRODUCT SECTION =================================

function callDeleteProduct() {

    $.ajax({
        url: "productRemover",
        type: "post",
        data: "productId=" + selectedProductIdToDelete,
        dataTypes: "json",
        success: deleteCallBack
    });
    return true;
}

function deleteCallBack(event) {
    if(event == "success") {
        if (currPageNumber != currentPageProducts[0].pageNumber) {
            getProductFromNextPage(parseInt(currPageNumber) + 1);
        }
        let sessionItem = JSON.parse(sessionStorage.getItem("page"+currPageNumber))
        for(let i =0; i<sessionItem.length; i++){
            if(sessionItem[i].productId == selectedProductIdToDelete){
                sessionItem.splice(i, 1);
                sessionItem = JSON.stringify(sessionItem);
                sessionStorage.setItem("page"+currPageNumber, sessionItem);
                break;
            }
        }
        return true;
    }
    return false;

}

function getProductFromNextPage(pageNumber) {
    $.ajax({
        url: "productRemover",
        type: "get",
        data: "pageNumber=" + pageNumber,
        dataTypes: "json",
        success: addProductToUI
    });

    for (let i = currPageNumber + 1; i < currentPageProducts[0].pageNumber; i++) {
        sessionStorage.setItem("page" + i, null);
    }
}

function addProductToUI(event){
    event = JSON.parse(event)
    let product = document.getElementById("firstProduct").cloneNode(true);
    product.id = event.productId;
    let productDetails = product.childNodes.item(1).childNodes.item(3).childNodes;
    productDetails.item(1).textContent = event.name;
    productDetails.item(3).textContent = event.vendor;
    productDetails.item(5).textContent = "$" + event.price;
    product.style.display = "inline"
    document.getElementById("allProducts").insertAdjacentElement("afterbegin", product);
    let sessionItem = JSON.parse(sessionStorage.getItem("page" + currPageNumber));
    sessionItem.push(event);
    sessionStorage.setItem("page" + currPageNumber, JSON.stringify(sessionItem));
}

//===============================ADD PRODUCT SECTION =========================================

function insertProduct() {
    let preValidationData = new FormData(document.getElementById("addForm"));
    if (validateAllInsertProductDate()) {
        postValidationData = preprocessingInsertProductData(Object.fromEntries(preValidationData.entries()))
        $.ajax({
            url: "product",
            cache: false,
            contentType: false,
            type: "post",
            processData: false,
            data: preValidationData,
            success: insertCallback
        });
    } else {
        errorPopup()
    }
}

function insertCallback(event) {
    if (event === "fail") {
        errorMsg = "Do not use same SKU for multiple products"
        errorPopup()
    } else if (event > currentPageProducts[0].pageNumber) {
        currentPageProducts[0].pageNumber = event;
        document.getElementById("nextPage").insertAdjacentHTML("beforebegin", '<li><a id="pageOne" onclick="loadPageProducts(this.text+\'p\')" >' + event + '</a></li>')
    }

    if (postValidationData) {
        let sessionItem = sessionStorage.getItem("page" + currentPageProducts[0].pageNumber);
        if (sessionItem != null && JSON.parse(sessionItem).length < productsPerPage) {
            sessionItem = JSON.parse(sessionItem);
            sessionItem.push(postValidationData);
            sessionStorage.setItem("page" + currentPageProducts[0].pageNumber, JSON.stringify(sessionItem));
        }
        if (currPageNumber == currentPageProducts[0].pageNumber && currentPageProducts.length != productsPerPage) {
            currentPageProducts = sessionItem;
            productsCountInCurrentPage++;
            clearProductsList();
            displayProducts();
        }
    }
    successPopup();
    clearInputData();
}

function clearInputData() {
    document.getElementById("addForm").reset();
}

function preprocessingInsertProductData(formEntries) {
    formEntries.name = formEntries.name.trim();
    formEntries.brand = formEntries.brand.trim();
    formEntries.vendor = formEntries.vendor.trim();
    formEntries.madeIn = formEntries.madeIn.trim();
    formEntries.price = formEntries.price.trim();
    formEntries.quantity = formEntries.quantity.trim();
    formEntries.sku = formEntries.sku.trim();
    formEntries.category = mapCategoryNameToCategoryId(formEntries.categoryId)
    return formEntries;

}

var preValidationData;
var postValidationData;
//=================================EDIT PRODUCT SECTION========================================
function editProduct() {
    preValidationData = new FormData(document.getElementById("editForm"));
    preValidationData.append("productId", currentPageProducts[selectedProductIndexInCurrPageProductsList].productId)
    postValidationData = validateEditData(Object.fromEntries(preValidationData.entries()))

    if (validateNumberInputsInEditProductDate()) {
        $.ajax({
              url: "product",
              data: preValidationData,
              cache: false,
                 contentType: false,
                 processData: false,
                 method: 'POST',
                 type: 'POST',
              success: editCallback,

            });

    } else {
        errorMsg = "Enter Valid Numbers for quantity and price"
        errorPopup()
    }
}

function addDataToEditRequest(formEntries) {
    preValidationData.set("name", formEntries.name)
    preValidationData.set("quantity", formEntries.quantity)
    preValidationData.set("vendor", formEntries.vendor)
    preValidationData.set("brand", formEntries.brand)
    preValidationData.set("madeIn", formEntries.madeIn)
    preValidationData.set("price", formEntries.price)
    preValidationData.set("description", formEntries.description)
    console.log(formEntries.categoryId)
    preValidationData.set("categoryId", formEntries.categoryId.toUpperCase())
    preValidationData.set("imageName", formEntries.imageName)

}


function editCallback(event) {

    if (event === "success") {
        currentPageProducts[selectedProductIndexInCurrPageProductsList] = postValidationData;
        sessionStorage.setItem("page" + currPageNumber, JSON.stringify(currentPageProducts));

        successPopup();
        let product = currentPageProducts[selectedProductIndexInCurrPageProductsList];
        let id = product.productId;
        document.getElementById(id)
                .querySelector(".product-title").textContent = product.name;
        document.getElementById(id)
                .querySelector(".product-vendor").textContent = product.vendor;
        document.getElementById(id)
                .querySelector(".product-price").textContent = "$" + product.price;
 document.getElementById(id)
                .querySelector("#prod-img").src = URL.createObjectURL(imageOne);

    } else if (event === "fail") {
        errorMsg = "Enter Valid Numbers for quantity and price"
        errorPopup()
    }

}

//======================================== NAVIGATION SECTION ==============================


function nextProduct() {
    if (selectedProductIndexInCurrPageProductsList < currentPageProducts.length - 1) {
        ++selectedProductIndexInCurrPageProductsList;
        displayCurrentProductDetailsInViewPopup();
    }
}

function prevProduct() {
    if (selectedProductIndexInCurrPageProductsList > 0) {
        --selectedProductIndexInCurrPageProductsList;
        displayCurrentProductDetailsInViewPopup();
    }
}

//======================================= open popups section =======================================


function errorPopup() {
    Swal.fire({
        title: 'Error!',
        text: errorMsg,
        icon: 'error',
        confirmButtonText: 'ok',
        iconColor: '#da1920',
        color: '#da1920',
        confirmButtonColor: '#da1920',
        width: '200px',
        toast: true
    })
}

function successPopup() {
    Swal.fire({
        position: 'bottom-end',
        icon: 'success',
        title: 'Your work has been saved',
        showConfirmButton: false,
        width: '250px',
        timer: 1500,
        iconColor: '#f76d2b',
        color: '#f76d2b',
        confirmButtonColor: '#f76d2b',
    })
}


function openQuickPopup(event) {
    let selectedProductId = event.id;
    quickView.style.display = "flex";
    //getting selected product index in the list using its productID
    for (selectedProductIndexInCurrPageProductsList = 0; selectedProductIndexInCurrPageProductsList < productsCountInCurrentPage; selectedProductIndexInCurrPageProductsList++) {
        if (currentPageProducts[selectedProductIndexInCurrPageProductsList].productId == selectedProductId) {
            displayCurrentProductDetailsInViewPopup();
            break;
        }
    }

}

function openAddPopup() {
    addView.style.display = "flex";
}

function openEditPopup(event) {
    let selectedProductId = event.id;
    editView.style.display = "flex";
    editView.querySelector("#priceError").style.display = "none";
    editView.querySelector("#quantityError").style.display = "none";
    editView.querySelector("#sku-label").style.display = "none";
    editView.querySelector("#prodSku").style.display = "none";
    for (selectedProductIndexInCurrPageProductsList = 0; selectedProductIndexInCurrPageProductsList < productsCountInCurrentPage; selectedProductIndexInCurrPageProductsList++) {
        if (currentPageProducts[selectedProductIndexInCurrPageProductsList].productId == selectedProductId) {
            displayCurrentProductDetailsInEditPopup();
            break;
        }
    }
}


function openDeletePopup(event) {
     selectedProductIdToDelete = event.id;

    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: 'btn btn-success',
            cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'No, cancel!',
        cancelButtonColor: "#EA6036A5",
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            if (callDeleteProduct()) {
                document.getElementById("allProducts").removeChild(event);
                swalWithBootstrapButtons.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                )
            }
        }
    })
}


function mapCategoryIdToCategoryName(id){
    if(id===1)
        return "Oil";
    if(id===2)
        return "Liquid";
    if(id===3)
       return "Plug";
    if(id===4)
        return "Battery";
    if(id===5)
       return "Tire";
}

function mapCategoryNameToCategoryId(name){
    if(name==="Oil")
        return 1;
    if(name==="Liquid")
        return 2;
    if(name==="Plug")
       return 3;
    if(name==="Battery")
        return 4;
    if(name==="Tire")
       return 5;
}


function displayCurrentProductDetailsInEditPopup() {
    $("#prodName").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].name);
    $("#prodBrand").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].brand);
    $("#prodVendor").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].vendor);
    $("#prodSku").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].sku);
    $("#prodMadeIn").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].madeIn);
    $("#prodPrice").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].price);
    $("#prodQuantity").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].quantity);
    $("#prodCategory").val(mapCategoryIdToCategoryName(currentPageProducts[selectedProductIndexInCurrPageProductsList].categoryId).toLowerCase());
    $("#prodDescription").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].description);
}


function displayCurrentProductDetailsInViewPopup() {
    let img = currentPageProducts[selectedProductIndexInCurrPageProductsList].images[0].imageName
    $("#open-quickview-popup #productImg").attr("src", "resource?image="+ img);
    $("#open-quickview-popup h3").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].name);
    $("#open-quickview-popup #brand").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].brand);
    $("#open-quickview-popup #vendor").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].vendor);
    $("#open-quickview-popup #sku").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].sku);
    $("#open-quickview-popup #sale-price").text("$" + currentPageProducts[selectedProductIndexInCurrPageProductsList].price);
    $("#open-quickview-popup #made-in").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].madeIn);
    $("#open-quickview-popup #quantity").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].quantity);
    $("#open-quickview-popup #category").text(mapCategoryIdToCategoryName(currentPageProducts[selectedProductIndexInCurrPageProductsList].categoryId));
    $("#open-quickview-popup #description").text(currentPageProducts[selectedProductIndexInCurrPageProductsList].description);
}

window.onclick = function (event) {
    if (event.target == quickView) {
        quickView.style.display = "none";
    }
    if (event.target == editView) {
        editView.style.display = "none";
    }

    if (event.target == deleteView) {
        deleteView.style.display = "none";
    }
    if (event.target == addView) {
        addView.style.display = "none";
    }
}


//=====================================VALIDATION SECTION=======================================
function validateQuantity(quantity) {

    if (quantity.trim() === "") {
        addView.querySelector("#quantity-Err").textContent = "Required Field";
        console.log("sssss")
        errorMsg = "Enter all required fields"
        console.log("QQQQ")
    } else {
        addView.querySelector("#quantity-Err").textContent = "";
        addView.querySelector("#product-quantity").value = addView.querySelector("#product-quantity").value.trim()
        return isQuantityValidNumber(quantity)

    }
}

function isQuantityValidNumber(quantity) {

    if (isNaN(quantity)) {
        editView.querySelector("#quantityError").style.display = "inline";
        addView.querySelector("#quantity-Err").textContent = "Enter Valid Number";
        errorMsg = "Enter valid numbers for price and quantity"
        return false;
    }
    editView.querySelector("#quantityError").style.display = "none";
    addView.querySelector("#product-price").value = addView.querySelector("#product-price").value.trim()
    addView.querySelector("#quantity-Err").textContent = "";
    return true;
}

function validatePrice(price) {
    if (price.trim() == "") {
        addView.querySelector("#price-Err").textContent = "Required Field";
        errorMsg = "Enter all required fields"
        console.log("444444")
        return false;
    } else {
        addView.querySelector("#price-Err").textContent = "";
        addView.querySelector("#product-price").value = addView.querySelector("#product-price").value.trim()
        return isPriceValidNumber(price)

    }
}

function isPriceValidNumber(price) {

    if (isNaN(price)) {
        editView.querySelector("#priceError").style.display = "inline";
        addView.querySelector("#price-Err").textContent = "Enter Valid Number";
        errorMsg = "Enter valid numbers for price and quantity"
        return false;
    }
    editView.querySelector("#priceError").style.display = "none";
    addView.querySelector("#price-Err").textContent = "";
    addView.querySelector("#product-price").value = addView.querySelector("#product-price").value.trim()

    return true;
}


function verifySku(sku) {

    if (sku.trim() != '') {
        addView.querySelector("#product-sku").value = addView.querySelector("#product-sku").value.trim()
        $.ajax({
            url: "sku", type: "GET", data: "sku=" + sku, success: result
        });
    } else {
        addView.querySelector("#sku-Err").textContent = "Required Field";
        errorMsg = "Enter all required fields"
console.log("momo")
    }
}

function result(event) {
    if (event.trim() == "Exists") {
        addView.querySelector("#sku-Err").textContent = "SKU Exists";
        errorMsg = "Do not use same SKU for multiple products"

    } else {
        addView.querySelector("#sku-Err").textContent = "";
    }
}

function validateName(name) {

    if (name.trim() == "") {
        addView.querySelector("#nameErr").className = "";
        errorMsg = "Enter all required fields"
        console.log("lolo")
    } else {
        addView.querySelector("#nameErr").className = "err";
        addView.querySelector("#product-name").value = addView.querySelector("#product-name").value.trim()

    }
}

function validateBrand(brand) {

    if (brand.trim() == "") {
        addView.querySelector("#brandErr").className = "";
        errorMsg = "Enter all required fields"
console.log("toto")
    } else {
        addView.querySelector("#brandErr").className = "err";
        addView.querySelector("#product-brand").value = addView.querySelector("#product-brand").value.trim()

    }
}

function validateVendor(vendor) {

    if (vendor.trim() == "") {
        addView.querySelector("#vendorErr").className = "";
        errorMsg = "Enter all required fields"
console.log("lplp")
    } else {
        addView.querySelector("#vendorErr").className = "err";
        addView.querySelector("#product-vendor").value = addView.querySelector("#product-vendor").value.trim()

    }
}

function validateMadeIn(madeIn) {

    if (madeIn.trim() === "") {
        addView.querySelector("#madeInErr").className = "";
        errorMsg = "Enter all required fields"
    } else {
        addView.querySelector("#madeInErr").className = "err";
        addView.querySelector("#product-madeIn").value = addView.querySelector("#product-madeIn").value.trim()
    }
}

function validateAllInsertProductDate() {
    if (    addView.querySelector("#madeInErr").className == "" ||
                addView.querySelector("#vendorErr").className == "" ||
                addView.querySelector("#nameErr").className == "" ||
                addView.querySelector("#brandErr").className == "" ||
                addView.querySelector("#sku-Err").textContent != "" ||
                addView.querySelector("#price-Err").textContent != "" ||
                addView.querySelector("#quantity-Err").textContent != "" ||
                addView.querySelector("#product-name").value == ""||
                addView.querySelector("#product-vendor").value == "" ||
                addView.querySelector("#product-madeIn").value == "" ||
                addView.querySelector("#product-brand").value == "" ||
                addView.querySelector("#product-price").value == "" ||
                addView.querySelector("#product-sku").value == "" ||
                addView.querySelector("#product-quantity").value == ""
    ) {
        errorMsg = "Enter all required fields"
        return false;
    }
    return true;
}



function validateEditData(formEntries) {
    if (formEntries.quantity.trim() == '') {
        formEntries.quantity = currentPageProducts[selectedProductIndexInCurrPageProductsList].quantity;
        $("#prodQuantity").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].quantity);
    } else {
        formEntries.quantity = formEntries.quantity.trim();
        $("#prodQuantity").val(formEntries.quantity);
    }

    if (formEntries.price.trim() == '') {
        formEntries.price = currentPageProducts[selectedProductIndexInCurrPageProductsList].price;
        $("#prodPrice").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].price);
    } else {
        formEntries.price = formEntries.price.trim();
        $("#prodPrice").val(formEntries.price);
    }
    if (formEntries.name.trim() == '') {
        formEntries.name = currentPageProducts[selectedProductIndexInCurrPageProductsList].name;
        $("#prodName").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].name);
    } else {
        formEntries.name = formEntries.name.trim();
        $("#prodName").val(formEntries.name);
    }

    if (formEntries.vendor.trim() == '') {
        formEntries.vendor = currentPageProducts[selectedProductIndexInCurrPageProductsList].vendor;
        $("#prodVendor").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].vendor);
    } else {
        formEntries.vendor = formEntries.vendor.trim();
        $("#prodVendor").val(formEntries.vendor);
    }
    if (formEntries.brand.trim() == '') {
        formEntries.brand = currentPageProducts[selectedProductIndexInCurrPageProductsList].brand;
        $("#prodBrand").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].brand);
    } else {
        formEntries.brand = formEntries.brand.trim();
    }
    if (formEntries.madeIn.trim() == '') {
        formEntries.madeIn = currentPageProducts[selectedProductIndexInCurrPageProductsList].madeIn;
        $("#prodMadeIn").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].madeIn);
    } else {
        formEntries.madeIn = formEntries.madeIn.trim();
        $("#prodMadeIn").val(formEntries.madeIn);
    }

    if(formEntries.imageName.value == ''){
        console.log(currentPageProducts[selectedProductIndexInCurrPageProductsList].imageName)
         formEntries.imageName = currentPageProducts[selectedProductIndexInCurrPageProductsList].imageName;
//            $("#edit-product-image-chooser").val(currentPageProducts[selectedProductIndexInCurrPageProductsList].imageName);
    }
    if (formEntries.description.trim() == '') {
        formEntries.description = formEntries.description.trim();
        $("#description").textContent = formEntries.description;
    }

    addDataToEditRequest(formEntries);
    return formEntries;
}

function validateNumberInputsInEditProductDate() {
    if(editView.querySelector("#priceError").style.display == "none" &&
        editView.querySelector("#quantityError").style.display == "none"){
        return true;
    }
    return false;
}
