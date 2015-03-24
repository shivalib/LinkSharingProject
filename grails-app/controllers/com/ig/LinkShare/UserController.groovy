package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO
import grails.converters.JSON

class UserController {
    UploadService uploadService
    def scaffold = true
//    def index() { }
    UserService userService
    ShowTopicService showTopicService

    def beforeInterceptor = [action: this.&checkAdmin, only: 'list']

    private checkAdmin() {
        if (session["username"]) {

            String currentUser = session["username"]
            User user = User.findByUsername(currentUser)

            if (user.admin) {
//                println "in interceptor"
                println user.admin

            } else {
                flash.message = "Sorry, this is reserved for Administrative access!!!"
                redirect(controller: 'home', action: 'index')
            }
        }
    }


    def list() {

        List<User> userList = User.list()

        User currentUser = userService.showCurrentUserObject(session["username"])

        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(session["username"])

        render(view: "/userListing/userListing", model: [userList: userList, loginUser: currentUser, topicList: topics.topicName])
    }

    def activateOrDeactivateUser() {
        User user = User.get(params.userID)
        user.active = !user.active
        user.save(failOnError: true, flush: true)

        render(template: "/userListing/isActiveOrDeactive", model: [user: user])

    }


    def registerUser(User user, UserCO userCO) {
        user.active = true
        user.admin = false

        user.photoPath = uploadService.uploadImage(user, params.img, grailsApplication.config.upload.uploadImages.toString())

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }

            flash.message = "Registration Failed : Password Mismatch"

        } else {
            user.save(failOnError: true)
            flash.message = "Registeration Successfull"
        }
        redirect(controller: "home", action: "index")

    }

    def resetPassword() {
        render(view: "/login/resetPassword")
    }

}