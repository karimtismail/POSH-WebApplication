$(document).ready(function (event) {

    // $("#dob").datepicker({
    //     dateFormat: 'yy-mm-dd',
    //     maxDate: '-14y', // Maximum date allowed (18 years ago)
    // });
    let validateForm = $("#register-form").validate({
        debug: true,
        rules: {
            firstName: {
                minlength: 3,
                maxlength: 32,
                pattern: /^[A-Za-z]+$/i
            },
            lastName: {
                minlength: 3,
                maxlength: 32,
                pattern: /^[A-Za-z]+$/i
            },
            email: {
                pattern: /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
                remote: {
                    url: "register",
                    type: "POST",
                    date: {
                        email: function () {
                            return $("#email").val();
                        }
                    }
                }
            },
            // dob: {
            //     required: true,
            //     date: true,
            //     max: '-14y'
            // },
            password: {
                minlength: 8
            },
            confirmPassword: {
                equalTo: "#password"
            },
            phoneNumber: {
                pattern: /^01[0125][0-9]{8}$/
            },
            address: {
                minlength: 15
            }
        },
        messages: {
            firstName: {
                minlength: "At least 3 characters required!",
                maxlength: "Maximum 32 character allowed!",
                pattern: "First name must contain letters only."
            },
            lastName: {
                minlength: "At least 3 characters required!",
                maxlength: "Maximum 32 character allowed!",
                pattern: "Last name must contain letters only."
            },
            email: {
                pattern: "Please enter a valid email address.",
                remote: "Email address already exists."
            },
            // dob: {
            //     required: "Please enter your date of birth",
            //     date: "Please enter a valid date",
            //     max: "You must be at least 14 years old"
            // },
            password: {
                minlength: "At least 8 characters required!"
            },
            confirmPassword: {
                equalTo: "Passwords don't match."
            },
            phoneNumber: {
                pattern: "Please enter a valid phone number."
            }
        },
        // submitHandler: function(form) {
        //     form.submit();
        // }
    });

    $("#firstName, #lastName, #email, #password, #confirmPassword, #phoneNumber, #address, #dob").blur(function () {
        validateForm.element(this);
    });

    $("#registerFormHandler").click(function () {

        let firstName = $("#firstName").val();
        let lastName = $("#lastName").val();
        let email = $("#email").val();
        let dob = $("#dob").val();
        let password = $("#password").val();
        let confirmPassword = $("#confirmPassword").val();
        let phoneNumber = $("#phoneNumber").val();
        let genderSelected = $("#genderSelected option:selected").text();
        let address = $("#address").val();
        let citySelected = $("#citySelected option:selected").text();

        if ($("#register-form").valid()) {
            console.log("congratulaiton...");
            $.ajax({
                type: "POST",
                url: "http://localhost:9191/posh/register",
                data: $("#register-form").serialize(),
                processData: false,
                success: function (data) {
                    console.log(data.name);
                },
                error: function () {
                    console.log("error in ajax");
                }
            });
        } else {
            console.log("falid...");
        }
    });
});
