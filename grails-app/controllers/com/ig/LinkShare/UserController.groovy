package com.ig.LinkShare

import LinkShareEnums.UserCO

class UserController {

    def scaffold = true
//    def index() { }

    def list()
    {

    }

    def UserProfile(){

    render(view: "UserProfile")
    }

    def registerUser(User user,UserCO userCO)
    {
        user.active=true
        user.admin=false

        if(!userCO.validate()) {
            userCO.errors.allErrors.each {
                println "Error in saving data"
            }

            flash.message = "Registration Failed : Password Mismatch"
            redirect(controller: "home")
        }
        else
        {
            user.save(failOnError: true)
            flash.message="Registeration Successfull"
            redirect(controller:"home")
        }
    }


}