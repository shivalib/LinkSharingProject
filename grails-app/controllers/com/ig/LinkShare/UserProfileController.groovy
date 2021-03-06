package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO


class UserProfileController {
    def uploadService
    def topicService
    def resourceService
    def topicSubscriptionService
    def springSecurityService

    def index() {
        def currentUser = springSecurityService.currentUser
        List<Topic> topicList = topicService.findTopicsCreatedByUser(currentUser)
        List<Subscription> subscriptionTopicList = topicSubscriptionService.currentUserSubscriptions(currentUser)

        render(view: "/userProfile/editProfile", model: [loginUser: currentUser, subscriptionTopicList: subscriptionTopicList, topicList: topicList])
    }

    def changePassword(UserCO userCO) {
        User currentUser = springSecurityService.currentUser
        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }
            flash.message = "Update Failed : Password Mismatch"
        } else {
            currentUser.password = params.password
            currentUser.save(failOnError: true, flush: true)
            flash.message = "Your password has been updated successfully !!"
        }
        redirect(controller: "userProfile", action: "index")
    }

    def showUserPublicProfile(Long id) {
        User currentUser = User.findById(id)
        List<Topic> topics = topicService.findTopicsCreatedByUser(currentUser)

        List<Resource> resourcesOfTopic = []
        topics.each {
            resourcesOfTopic += resourceService.showResourcesByTopic(it)
        }

        render(view: "/user/userProfile", model: [loginUser: currentUser, topicList: topics, resourcesOfTopic: resourcesOfTopic])
    }

    def updateData() {
        User currentUser = springSecurityService.currentUser
        currentUser.firstName = params.firstName
        currentUser.lastName = params.lastName
        currentUser.username = params.username

        def imagePath = params.img
        if (!imagePath.isEmpty()) {
            currentUser.photoPath = uploadService.uploadImage(currentUser, params.img, grailsApplication.config.upload.uploadImages.toString())
        }
        if (currentUser.save(failOnError: true, flush: true)) {
            flash.message = "Your data has been updated successfully!!"
        } else {
            flash.message = "Data update failed!!"
        }
        redirect(controller: "userProfile", action: "index")
    }
}
