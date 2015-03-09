package com.ig.LinkShare

import LinkShareEnums.UserCO

class UserController {

    def scaffold = true
//    def index() { }


    def beforeInterceptor=[action: this.&checkAdmin,only:'list' ]

    private checkAdmin() {
        if (session["username"]) {

            String currentUser = session["username"]
            User user = User.findByUsername(currentUser)

            if (user.admin) {
                println "in interceptor"
                println user.admin

            } else {
                redirect(controller: 'home', action: 'index')
                flash.message = "Sorry, this is reserved for Administrative access !!!"
            }
        }
//
//        else{
//            redirect(controller: 'home',action: 'index')
//            flash.message="login to system"
//        }
    }


    def list() {
        println "in list"
        List<User> userList = User.list()
        println userList
        println params

        render(view: "/user/UserListing", model: [userList: userList])
    }


    def UserProfile() {

        render(view: "UserProfile")
    }


    def registerUser(User user, UserCO userCO) {
        user.active = true
        user.admin = false

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println "Error in saving data"
            }

            flash.message = "Registration Failed : Password Mismatch"
            redirect(controller: "home", action: "index")
        } else {
            user.save(failOnError: true)
            flash.message = "Registeration Successfull"
            redirect(controller: "home", action: "index")
        }
    }


}