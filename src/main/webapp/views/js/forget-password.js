$(document).ready(function () {
    // Validation rules for form fields
    const validationRules = {
        email: {
            required: true,
            email: true
        },
    };

    // Validation error messages for form fields
    const validationMessages = {
        required: "Please enter your email",
        email: "Please enter a valid email address"
    };

    // Initialize form validation
    const validateForm = $("#resetPasswordForm").validate({
        debug: true,
        rules: validationRules,
        messages: validationMessages,
    });

    // Trigger validation on blur of input fields
    $("#email").blur(function () {
        validateForm.element(this);
    });

    $("#resetPasswordButton").click(function () {
        if ($("#resetPasswordForm").valid()) {
            let myForm = document.getElementById("resetPasswordForm");
            let formData = new FormData(myForm);
            let value = JSON.stringify(Object.fromEntries(formData.entries()));
            console.log(Object.fromEntries(formData.entries()));
            console.log(formData);
            $.ajax({
                url: "forget-password",
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
                            icon: 'success',
                            title: 'Send Email Successfully',
                            iconColor: '#f76d2b',
                            showConfirmButton: false,
                            timer: 2000,
                        });
                        window.location.href = "login"
                        return "true";
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oposss',
                            text: 'failed send email',
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