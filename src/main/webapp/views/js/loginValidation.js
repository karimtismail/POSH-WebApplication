$(document).ready(() => {
    var check = false;
    $("#email").blur(function () {
        var email = $(this).val().trim();
        if (!email) {
            $("#email_error").text("Email address is required");
            $(this).addClass("is-invalid");
            check = false;
        } else if (!isValidEmail(email)) {
            $("#email_error").text("Invalid email address");
            $(this).addClass("is-invalid");
            check = false;
        } else {
            $("#email_error").text("");
            $(this).removeClass("is-invalid");
            check = true;
        }
    });
    $("#password").blur(function () {
        var password = $(this).val().trim();
        if (!password) {
            $("#password_error").text("Password is required");
            $(this).addClass("is-invalid");
            check = false;
        } else {
            $("#password_error").text("");
            $(this).removeClass("is-invalid");
            check = true;
        }
    });

    function isValidEmail(email) {
        var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
        return emailRegex.test(email);
    }

    $("#signInButton").click(function () {
        if (check) {
            let myForm = document.getElementById("login-from");
            let formData = new FormData(myForm);
            let rememberMeCheckBox = document.getElementById("dropdownCheck").checked.toString();
            formData.append("rememberMeCheckBox", rememberMeCheckBox);
            let value = JSON.stringify(Object.fromEntries(formData.entries()));
            $.ajax({
                url: "login",
                type: "POST",
                data: value,
                dataType: "json",
                processData: false,
                contentType: false,
                dataFilter: function (response) {
                    console.log(response)
                    var json = JSON.parse(response);
                    if (json.status === "successUser") {
                        window.location.href = "home";
                        return "true";
                    } else if (json.status === "successAdmin") {
                        window.location.href = "dashboard";
                        return "true";
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oposss',
                            text: 'failed login!\nEmail or password is wrong',
                            iconColor: '#f76d2b',
                            confirmButtonColor: '#f76d2b',
                        });
                    }
                }
            });
        }
    });
});
