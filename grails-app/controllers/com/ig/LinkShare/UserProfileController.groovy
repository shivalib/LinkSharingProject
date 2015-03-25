package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO


class UserProfileController {
    def uploadService
    def userService
    def showTopicService
    def showResourceService

    def index() {
        if (session["username"]) {
            User currentUser = User.findByUsername(session["username"])

            List<Topic> topicList = Topic.findAllWhere(createdBy: currentUser)
            render(view: "/userProfile/editProfile", model: [loginUser: currentUser, topicList: topicList])
        }
    }

    def changePassword(User user, UserCO userCO) {
        User currentUser = User.findByUsername(session["username"])

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }

            flash.message = "Updation Failed : Password Mismatch"
        } else {
            currentUser.password=params.password
            currentUser.save(failOnError: true,flush: true)
            flash.message = "Your password has been updated successfully !!"
        }

        redirect(controller: "userProfile", action: "index")
    }

    def showUserPublicProfile(){
        User currentUser = User.findById(params.id)

        List<Topic> topics = showTopicService.findTopicsCreatedByCurrentUser(session["username"])

        List<Resource> resourcesOfTopic=[]
        topics.each {
            resourcesOfTopic+=showResourceService.showResourcesByTopic(it)
        }

        render(view: "/user/userProfile",model: [loginUser: currentUser,topicList:topics,resourcesOfTopic:resourcesOfTopic])

    }

    def updateData() {
        User currentUser = User.findByUsername(session["username"])
        currentUser.firstName=params.firstName
        currentUser.lastName=params.lastName
        currentUser.username=params.username

        currentUser.photoPath=uploadService.uploadImage(currentUser,params.img,grailsApplication.config.upload.uploadImages.toString())
           if(currentUser.save(failOnError: true,flush: true))
           {
               flash.message = "Your data has been updated successfully!!"
           }
        else
           {
               flash.message = "Data updation failed!!"
           }

        redirect(controller: "userProfile", action: "index")
    }

    def paginatePosts(){

    }

}
