$(document).ready(() => {
    // Validation rules for form fields
    const validationRules = {
        currentPassword: {
            required: true,
            minlength: 8,
        },
        newPassword: {
            required: true,
            minlength: 8,
        },
        confirmPassword: {
            equalTo: "#newPassword"
        }
    };

    // Validation error messages for form fields
    const validationMessages = {
        currentPassword: {
            minlength: "At least 8 characters required!",
        },
        newPassword: {
            minlength: "At least 8 characters required!",
        },
        confirmPassword: {
            equalTo: "Passwords don't match.",
        }
    };

    // Initialize form validation
    const validateForm = $("#changePasswordForm").validate({
        debug: true,
        rules: validationRules,
        messages: validationMessages,
    });

    // Trigger validation on blur of input fields
    $("#currentPassword, #newPassword, #confirmPassword").blur(function () {
        validateForm.element(this);
    });

    $("#changePasswordButton").click(function () {
        if ($("#changePasswordForm").valid()) {
            let myForm = document.getElementById("changePasswordForm");
            let formData = new FormData(myForm);
            let value = JSON.stringify(Object.fromEntries(formData.entries()));
            console.log(value)
            console.log(formData)
            $.ajax({
                url: "change-password",
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
                            title: 'Saved New Password',
                            iconColor: '#f76d2b',
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        return "true";
                    } else if (json.status === "errorVerifyPassword") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oposss',
                            text: 'Your inputted Current Password Is Wrong',
                            iconColor: '#f76d2b',
                            confirmButtonColor: '#f76d2b',
                        });
                    }
                    else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oposss',
                            text: 'Failed Update Password',
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