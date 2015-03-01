package com.ig.LinkShare

import LinkShareCmdObjects.RegisterUserCommand

class LoginController {

    def index() {
//        render(view: "/user/HomePage")

    }

    def loginHandler(String username,String password) {
        if (User.findByUsernameAndPassword(username, password) )
        {
            //...........println "Valid user"
            session["username"] = "${params.username}"
            println session["username"]

            redirect(controller: "home", action: "dashboard" ,params: [username:username])
        }
        else {
            //......println "Invalid user"
            redirect(controller: "login" )
        }
    }

    def logout()
    {
        flash.message = "Goodbye ${session["username"]}"
        session["username"] = null
        redirect(controller:"login")
    }

    def registerUser(User user)
    {
        user.active=true
        user.admin=false

        println user.validate()

        if(!user.save(failOnError: true))
        {
        flash.message= "Registration Failed"
            redirect(controller:"home")
        }
        else
        {
            flash.message="Registeration Successfull"
            redirect(controller:"home")
        }

    }

//    def register={UserCommand cmd->
//        if(cmd.hasErrors())
//        {
//            cmd.errors.allErrors.each {println it}
//        }
//        else
//        {
//            redirect(action: "registerUser")
//        }
//    }
}
//
//class UserCommand
//{
//    String password
//    String confirmPassword
//
//    static constraints
//    {
//    password nullable:false, blank:false,validator:{val,obj->
//        if(!(val==obj.password))
//            {
//            return "some error occur"
//            }
//        }
//    }
//}
