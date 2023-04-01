var username;

function getUsers() {
console.log("getusers")
    $.ajax({
        url: 'getUsers', //servlet url
        type: 'GET', //servlet request type
        dataType: 'json',
        success: viewUsers
    });
}

function viewUsers(event) {
console.log("viewusers "+ event)

    document.getElementById("users-tbody").innerHTML = "";
    for (let i = 0; i < event.length; i++) {
        document.getElementById("users-tbody").innerHTML += `<tr id="firstRow" scope="row">
                    <td class="name">${event[i].username}</td>
                    <td>${event[i].email}</td>
                    <td>${event[i].phoneNumber}</td>
                    <td>${event[i].city}
                        <small class="d-block">${event[i].address}</small>
                    </td>
                    <td>${event[i].dob}</td>
                    <td>${event[i].creditLimit}</td>
                    <td class="userId" hidden>${event[i].id}</td>
                    <td><a href="#" class="more" onclick="moreDetails(this.closest('#firstRow'))">Details</a></td>
                </tr>`
    }
    console.log("donee")

}

function moreDetails(firstRow) {
    let userId = firstRow.querySelector(".userId").textContent
    username = firstRow.querySelector(".name").textContent
    $.ajax({
        url: 'getUsers', //servlet url
        type: 'Post', //servlet request type
        data: "userId=" + userId,
        dataType: 'json',
        success: openUserDetailsPopup
    });

}

function openUserDetailsPopup(event) {
    if(event.length==0){
        Swal.fire({
            title: '<p>No orders found for: </p><strong>' + username + '</strong>',
            width: 'auto',
            icon: 'warning',
            iconColor: "#f76d2b",
            timer: 2500,
            showConfirmButton: false
        });
    }
    else{
        let table = ' <table class="table table-striped custom-table">\n' +
            '                <thead>\n' +
            '                <tr>\n' +
            '                    <th scope="col">Number</th>\n' +
            '                    <th scope="col">Date</th>\n' +
            '                    <th scope="col">Address</th>\n' +
            '                    <th scope="col">Product</th>\n' +
            '                    <th scope="col">Total</th>\n' +
            '                    <th scope="col">Notes</th>\n' +
            '                </tr>\n' +
            '                </thead>\n' +
            '                <tbody id="users-tbody">';


        for (let i = 0; i < event.length; i++) {
            let date =  event[i].orderDate.split(",")[0]+" "+event[i].orderDate.split(",")[1]
            let time = event[i].orderDate.split(",")[2]
            let innerTable = '<tr> \n' +
                ' <td>' + event[i].id + '</td> \n' +
                ' <td>' + date+'<br>'+time + '</td> \n' +
                ' <td>' + event[i].shippingAddress + '</td> \n' +
                ' <td>\n <div class="tb">\n' +
                '    <input type="checkbox"/>\n' +
                '    <span>Show</span><span>Hide</span> <table class="collapsible" id="collapsible1">\n <thead >\n<tr>\n<th>Name</th>\n<th>Quantity</th>\n</tr>\n</thead>\n<tbody>\n';
            for (let j = 0; j < event[i].products.length; j++) {
                innerTable += '<tr>\n<td>' + event[i].products[j].name + '</td>\n' +
                    '<td>' + event[i].products[j].quantity + '</td>\n</tr>\n'
            }
            innerTable += '</tbody>\n</table>\n </div></td>\n' +
                ' <td>' + event[i].totalPrice + '</td></tr> \n'+
                ' <td>' + event[i].orderNotes + '</td></tr> \n';
            table += innerTable;
        }

        table += '</tbody>\n</table>';

        Swal.fire({
            title: '<strong style="text-align: left">' + username + '</strong>',
            html: table,
            width: 'auto',
            confirmButtonColor:'#f76d2b',
        });
    }



}

