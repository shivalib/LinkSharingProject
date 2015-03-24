
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
                required:true,
                minlength:3
            },
            lastName:{
                required:true,
                minlength:3
            },
            email:{
                required:true,
                email:true
            },
            username:{
                required:true,

                remote: {
                    url: $('#checkUsername').attr('data-checkUsername'),
                    type: 'post',
                    data: {
                        username: function () {
                            return $('#checkUsername').val()
                        }
                    }
                },
                minlength:5
            },
            password:{
                required:true,
                minlength:5
            },
            confirmPassword:{
                required:true
            }
        },
        messages:{
            firstName:{
                required:"First Name cannot be empty",
                minlength:"Too short! Min length :3"
            },
            lastName:{
                required:"Last Name cannot be empty",
                minlength:"Too short! Min length :5"
            },
            email:{
                required:"Email is required",
                email:"Enter a valid Email ID"
            },
            username:{
                required:"Username cannot be empty",
                minlength:"Too short! Min length :5",
                remote:"Username already exists, try something different!"

            },
            password:{
                required:"Password cannot be empty",
                minlength:"Too short! Min length :5"
            },
            confirmPassword:"Enter password again to confirm it"
        }
    })

});
