$(document).ready(() => {
    // Add custom method for pattern validation
    $.validator.addMethod("pattern", function (value, element, pattern) {
        return this.optional(element) || pattern.test(value);
    }, "Invalid format.");

    $.validator.addMethod("dateInPast", function (value, element) {
        var today = new Date();
        var dob = new Date(value);
        console.log(today)
        console.log(dob)
        return dob < today;
    }, "Date of birth must be in the past.");
    // Validation rules for form fields
    const validationRules = {
        username: {
            minlength: 3,
            maxlength: 32,
            pattern: /^[A-Za-z]+([\sA-Za-z]+)*$/,
        },
        email: {
            required: true,
            email: true,
            remote: {
                url: "register",
                type: "POST",
                data: {
                    email: function () {
                        return $("#email").val();
                    }
                },
                async: true,
                beforeSend: function () {
                    // Remove any existing error messages
                    $("#email-error").text("");
                },
                success: function (response) {
                    var status = response.emailExists;
                    var message = status ? "Email already exists." : "Email is available!";
                    $("#email").toggleClass("error", status).toggleClass("success", !status);
                    $("#email-error").text(message); // Update the error message
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            }
        },
        dateOfBirth: {
            required: true,
            date: true,
            dateInPast: true,
        },
        password: {
            minlength: 8,
        },
        confirmPassword: {
            equalTo: "#password",
        },
        phoneNumber: {
            pattern: /^01[0125][0-9]{8}$/,
        },
        address: {
            minlength: 15,
        },
        creditLimit: {
            pattern: /^[0-9]+$/,
        },
    };

    // Validation error messages for form fields
    const validationMessages = {
        username: {
            minlength: "At least 3 characters required!",
            maxlength: "Maximum 32 character allowed!",
            pattern: "First name must contain letters only.",
        },
        email: {
            required: "Please enter your email",
            email: "Please enter a valid email address",
        },
        dateOfBirth: {
            required: "Please enter your date of birth.",
            date: "Please enter a valid date in the format yyyy-mm-dd.",
            dateInPast: "Date of birth must be in the past.",
        },
        password: {
            minlength: "At least 8 characters required!",
        },
        confirmPassword: {
            equalTo: "Passwords don't match.",
        },
        phoneNumber: {
            pattern: "Please enter a valid phone number.",
        },
        address: {
            minlength: "At least 15 characters required!",
        },
        creditLimit: {
            pattern: "Please enter a valid limit number.",
        },
    };

    // Initialize form validation
    const validateForm = $("#register-form").validate({
        debug: true,
        rules: validationRules,
        messages: validationMessages,
    });

    // Trigger validation on blur of input fields
    $("#username, #creditLimit, #password, #confirmPassword, #phoneNumber, #address, #dob").blur(function () {
        validateForm.element(this);
    });

    // Trigger validation on change of email field
    $("#email").change(() => {
        validateForm.element("#email");
    });
});

$("#registerFormHandler").click(function () {
    if ($("#register-form").valid()) {

        let myForm = document.getElementById("register-form");
        let formData = new FormData(myForm);
        let value = JSON.stringify(Object.fromEntries(formData.entries()));
        $.ajax({
            url: "submitregister",
            type: "POST",
            data: value,
            dataType: "json",
            processData: false,
            contentType: false,
            dataFilter: function (response) {
                var json = JSON.parse(response);
                if (json.status === "success") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Submitted Successfully',
                        text: 'Now that you have a new account!',
                        iconColor: '#f76d2b',
                        confirmButtonColor: '#f76d2b',
                    });
                    window.location.href = "login";
                    return "true";
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oposss',
                        text: 'Account creation failed!',
                        iconColor: '#f76d2b',
                        confirmButtonColor: '#f76d2b',
                    });
                }
            }
        });
    } else {
        console.log("falid...");
    }
});

