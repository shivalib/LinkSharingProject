package com.ig.LinkShare

class UserController {

    def scaffold = true
//    def index() { }

    def list()
    {

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
//    }

}
//
//class UserCommand {
//    String password
//    String confirmPassword
//
//    static constraints
//    {
//        password nullable: false, blank: false
//        confirmPassword
//        //        validator: { val, obj ->
////            if (!(val == obj.password)) {
////                return "some error occur"
////            }
////        }
//    }
//}