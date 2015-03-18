
$(document).ready(function () {

    $('#login').validate({
        rules:{
            email:{
                required:true,
                email:true,

                remote: {
                    url: $('#submitLogin').attr('data-emailValidate'),
                    type: 'post',
                    data: {
                        email: function () {
                            return $('#emailID').val()
                        }
                    }
                }

            },
            password:{
                required:true
            }

        },
        messages:{
            email:{
                required:"Email cannot be empty",
                email:"Enter a valid email id",
                remote:"Email Id not found"
            },
            password:"Password cannot be empty"
        }

    });

    $('#registerForm').validate({
        rules:{
            firstName:{
                required:true
            },
            lastName:{
                required:true
            },
            email:{
                required:true,
                email:true
            },
            username:{
                required:true
            },
            password:{
                required:true
            },
            confirmPassword:{
                required:true
            }
        },
        messages:{
            firstName:"First Name cannot be empty",
            lastName:"Last Name cannot be empty",
            email:{
                required:"Email is required",
                email:"Enter a valid Email ID"
            },
            username:"Username cannot be empty",
            password:"Password cannot be empty",
            confirmPassword:"Enter password again to confirm it"
        }
    })

});
