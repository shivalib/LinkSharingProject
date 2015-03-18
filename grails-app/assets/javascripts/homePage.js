
$(document).ready(function () {

    $('#login').validate({
        rules:{
            username:{
                required:true
            },
            password:{
                required:true
            }
        },
        messages:{
            username:"Username cannot be empty",
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
