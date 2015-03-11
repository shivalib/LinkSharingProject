package com.ig.LinkShare

import LinkShareEnums.UserCO

class UserController {

    def scaffold = true
//    def index() { }


    def beforeInterceptor = [action: this.&checkAdmin, only: 'list']

    private checkAdmin() {
        if (session["username"]) {

            String currentUser = session["username"]
            User user = User.findByUsername(currentUser)

            if (user.admin) {
                println "in interceptor"
                println user.admin

            } else {
                //todo mind the sequence of redirect and flash.message
                redirect(controller: 'home', action: 'index')
                //todo redirect context wise shud belong to an action
                flash.message = "Sorry, this is reserved for Administrative access!!!"
            }
        }
    }


    def list() {
        println "in list"
        List<User> userList = User.list()
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
//            redirect(controller: "home", action: "index")
        } else {
            user.save(failOnError: true)
            flash.message = "Registeration Successfull"
//            redirect(controller: "home", action: "index")
        }
        //todo found no forward, redirect, render
    }


}