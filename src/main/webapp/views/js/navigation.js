function goToHome() {
    document.getElementById('usersListDiv').style.display = "none";
    document.getElementById('productsListDiv').style.display = "inline";
    document.getElementById("add-product-btn").style.display = "inline";
    loadPageProducts(1)
}

function goToUsers() {
    clearProductsList()
    document.getElementById('productsListDiv').style.display = "none";
    document.getElementById("add-product-btn").style.display = "none";
    document.getElementById('usersListDiv').style.display = "inline";
    getUsers()
}