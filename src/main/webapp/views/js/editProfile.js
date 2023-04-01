$(document).ready(() => {
    $.validator.addMethod("pattern", function (value, element, pattern) {
        return this.optional(element) || pattern.test(value);
    }, "Invalid format.");

    // Validation rules for form fields
    const validationRules = {
        username: {
            required: false,
            minlength: 3,
            maxlength: 32,
            pattern: /^[A-Za-z]+([\sA-Za-z]+)*$/,
        },
        password: {
            required: false,
            minlength: 8,
        },
        phoneNum: {
            required: false,
            pattern: /^01[0125][0-9]{8}$/,
        },
        address: {
            required: false,
            minlength: 15,
        },
        creditLimit: {
            required: false,
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
        password: {
            minlength: "At least 8 characters required!",
        },
        phoneNum: {
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
    const validateForm = $("#editProfileForm").validate({
        debug: true,
        rules: validationRules,
        messages: validationMessages,
    });

    // Trigger validation on blur of input fields
    $("#username, #creditLimit, #password, #phoneNum, #address").blur(function () {
        validateForm.element(this);
    });

    $("#saveChangesButton").click(function () {
        if ($("#editProfileForm").valid()) {
            let myForm = document.getElementById("editProfileForm");
            let formData = new FormData(myForm);
            let value = JSON.stringify(Object.fromEntries(formData.entries()));
            console.log(value)
            console.log(formData)
            $.ajax({
                url: "profile",
                type: "POST",
                data: value,
                dataType: "json",
                processData: false,
                contentType: false,
                dataFilter: function (response) {
                    console.log(response)
                    var json = JSON.parse(response);
                    if (json.status === "success") {
                        Swal.fire({
                            icon: 'sucess',
                            title: 'Saved Changes',
                            iconColor: '#f76d2b',
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        window.location.href="profile"
                        return "true";
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oposss',
                            text: 'failed edit profile',
                            iconColor: '#f76d2b',
                            confirmButtonColor: '#f76d2b',
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.log(xhr.responseText);
                    console.log(status)
                    console.log(error)
                }
            });
        }
    });
});