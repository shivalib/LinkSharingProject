package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.GenerateToken
import com.ig.LinkShare.applicationEnums.UserCO
import grails.plugin.springsecurity.annotation.Secured

class UserController {
    def uploadService
    def scaffold = true
    def showTopicService
    def springSecurityService

    @Secured(['ROLE_ADMIN'])
    def list() {
        List<User> userList = User.list()
        User currentUser = springSecurityService.currentUser
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)
        render(view: "/userListing/userListing", model: [userList: userList, loginUser: currentUser, topicList: topics])
    }

    @Secured(['ROLE_ADMIN'])
    def activateOrDeactivateUser() {
        User user = User.get(params.userID)
        user.active = !user.active
        user.save(failOnError: true, flush: true)

        render(template: "/userListing/isActiveOrDeactive", model: [user: user])
    }

    def registerUser(User user, UserCO userCO) {
        user.active = false
        user.admin = false

        user.photoPath = uploadService.uploadImage(user, params.img, grailsApplication.config.upload.uploadImages.toString())

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }
            flash.message = "Registration Failed : Password Mismatch!"

        } else {
            user.save(failOnError: true, flush: true)

            generateToken(user)
            UserToken userToken = UserToken.findByUser(user)
            defineRole(user)
            sendMail {
                to "${user.email}"
                subject "Required Confirmation : LinkShare"
                html "${g.link(controller: "home", action: "activateRegisteredUser", id: "${userToken.id}", absolute: true, { "click on this link to confirm your Email" })}"
            }

            flash.message = "Registration Successful. An email have been sent to your registered ID, confirm your email by clicking on the link sent!"
        }
        redirect(controller: "home", action: "index")
    }

    def generateToken(User user) {
        GenerateToken generateToken = new GenerateToken()
        generateToken.generateTokenForRegisteredUser(user)
    }

    def defineRole(User user) {
        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true, flush: true)
        setRole(user, userRole)
    }

    def setRole(User user, SecRole secRole) {
        if (!user.authorities.contains(secRole)) {
            SecUserSecRole.create(user, secRole, true)
        }
    }

    def resetPassword(Long id) {

        UserToken userToken = UserToken.get(id)
        def emailID = userToken.user.email
        render(view: "/login/resetPassword", model: [emailID: emailID])
    }

    def changeUserList() {
        List<User> userList = []
        switch (params.selectVal) {
            case "Active":
                userList = User.findAllWhere(active: true)
                break
            case "Inactive":
                userList = User.findAllWhere(active: false)
                break
            case "AllUsers":
                userList = User.findAll()
                break
        }
        render(template: "/userListing/userEntry", model: [userList: userList])
    }
}