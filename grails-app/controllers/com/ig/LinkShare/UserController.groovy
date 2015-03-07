package com.ig.LinkShare

import LinkShareEnums.UserCO

class UserController {

    def scaffold = true
//    def index() { }


    def beforeInterceptor=[action: this.&checkAdmin,only:['list']]



    def checkAdmin(){

        String currentUser=session["username"]
        User user=User.findByUsername(currentUser)
        if(user.admin=="true")
        {
            redirect(action: "list")
        }
        else
        {
            flash.message="Sorry, this is reserved for Administrative access !!!"
        }
    }

    def list()
    {
    println "in list"

    List<User> userList=User.list()

        render(view: "/user/UserListing",model: [userList:userList])
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
            redirect(controller: "home",action: "index")
        }
        else
        {
            user.save(failOnError: true)
            flash.message="Registeration Successfull"
            redirect(controller:"home",action: "index")
        }
    }


}