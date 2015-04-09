package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO


class UserProfileController {
    def uploadService
    def userService
    def showTopicService
    def showResourceService
    def topicSubscriptionService
    def top5SubscriptionService

    def index() {

        User currentUser = User.get(session["userID"])

        List<Topic> topicList = showTopicService.findTopicsCreatedByUser(currentUser)

        List<Subscription> subscriptionTopicList = topicSubscriptionService.currentUserSubscriptions(currentUser)

        render(view: "/userProfile/editProfile", model: [loginUser: currentUser, subscriptionTopicList: subscriptionTopicList, topicList: topicList])
    }

    def changePassword(User user, UserCO userCO) {
        User currentUser = User.get(session["userID"])

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }

            flash.message = "Updation Failed : Password Mismatch"
        } else {
            currentUser.password = params.password
            currentUser.save(failOnError: true, flush: true)
            flash.message = "Your password has been updated successfully !!"
        }

        redirect(controller: "userProfile", action: "index")
    }

    def showUserPublicProfile(Long id) {

        User currentUser = User.findById(id)

        List<Topic> topics = showTopicService.findTopicsCreatedByUser(currentUser)

        List<Resource> resourcesOfTopic = []
        topics.each {
            resourcesOfTopic += showResourceService.showResourcesByTopic(it)
        }

        render(view: "/user/userProfile", model: [loginUser: currentUser, topicList: topics, resourcesOfTopic: resourcesOfTopic])
    }

    def updateData() {
        User currentUser = User.get(session["userID"])
        currentUser.firstName=params.firstName
        currentUser.lastName=params.lastName
        currentUser.username=params.username

        def imagePath = params.img
        if(!imagePath.isEmpty())
        {
            currentUser.photoPath = uploadService.uploadImage(currentUser, params.img, grailsApplication.config.upload.uploadImages.toString())
        }

        if (currentUser.save(failOnError: true, flush: true)) {
            flash.message = "Your data has been updated successfully!!"
        } else {
            flash.message = "Data update failed!!"
        }
        redirect(controller: "userProfile", action: "index")
    }

    def paginatePosts() {

    }

}
