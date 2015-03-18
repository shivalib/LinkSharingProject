package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO

class UserController {
    UploadService uploadService
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
                flash.message = "Sorry, this is reserved for Administrative access!!!"
                redirect(controller: 'home', action: 'index')
            }
        }
    }


    def list() {
        println "in list"
        List<User> userList = User.list()
        println params

        render(view: "/userListing/userListing", model: [userList: userList])
    }


    def UserProfile() {

        render(view: "UserProfile")
    }


    def registerUser(User user, UserCO userCO) {
        user.active = true
        user.admin = false

        user.photoPath=uploadService.uploadImage(user,params.img,grailsApplication.config.upload.uploadImages.toString())

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

    def resetPassword(){
        println "in resetpassword........."
        println "${params}"
//        params.emailID
        render(view: "/login/resetPassword")
    }

}