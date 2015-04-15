package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class TopicController {

    def topicSubscriptionService
    def showResourceService
    def showTopicService
    def springSecurityService

    def index(Long id) {
        Topic topic = Topic.get(id)
        User loginUser = springSecurityService.currentUser
        List<Subscription> subscriptionList = topicSubscriptionService.subscriptionListOfCurrentTopic(topic)
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(loginUser)
        List<Resource> resourceList = showResourceService.showResourcesByTopic(topic)

        render(view: "/topic/topicShow", model: [topic: topic, topicList: topics, loginUser: loginUser, subscribers: subscriptionList, resources: resourceList])
    }

    def showTopicList() {
        User currentUser = springSecurityService.currentUser

        List<Topic> topics = showTopicService.findTopicsCreatedByUser(currentUser)

        render(view: "topicList", model: [loginUser: currentUser, topicList: topics])
    }

    @Secured(['ROLE_ADMIN'])
    def topicListForAdmin() {
        User currentUser = springSecurityService.currentUser
        List<Topic> topicList = Topic.list()
        render(view: "topicList", model: [loginUser: currentUser, topicList: topicList])
    }

    def createTopic() {
        User userID = springSecurityService.currentUser
        List<Topic> topicList = showTopicService.findTopicsNameCreatedByUser(userID)

        if (topicList.contains(params.topicName)) {
            flash.message = "Topic creation failed,topic with name : ${params.topicName} already exists!"
        } else {
            Topic topic1 = new Topic(topicName: params.topicName, visibility: params.topicType)
            userID.addToTopics(topic1)

            if (topic1.save(failOnError: true)) {

                Subscription subscribe = topicSubscriptionService.subscribeTopic(userID, topic1)

                flash.message = "Your topic has been created!"
            } else {
                flash.message = "Sorry, topic creation failed!"
            }
        }
        redirect(controller: "home", action: "dashboard")
    }

    Boolean validateTopicName() {

        List<Topic> topicList = Topic.createCriteria().list {
            projections {
                property("topicName")
            }
        }

        if (topicList.contains(params.topicName))
            render true
        else
            render false
    }

    def updateTopic(Long id) {
        Topic topic = Topic.load(id)
        topic.topicName = params.topicName

        if (topic.save(failOnError: true, flush: true)) {
            flash.message = "Topic have been successfully renamed to ${topic.topicName}!"
        } else {
            flash.message = "Topic renaming failed!"
        }
        forward(controller: "home", action: "dashboard")
    }

    def updateResource(Long id) {

        Resource resource = Resource.get(id)
        resource.description = params.description

        resource.save(failOnError: true, flush: true)

        if (resource.save(failOnError: true, flush: true)) {
            flash.message = "Resource have been successfully edited to : ${resource.description}!"
        } else {
            flash.message = "Resource editing failed!"
        }

        forward(controller: "showPost", action: "index")
    }

    def deleteResource(Long id) {
        Resource resource = Resource.get(id)

        if (resource.delete(failOnError: true, flush: true)) {
            flash.message = "Resource have been removed!"
        } else {
            flash.message = "Resource deletion failed!"
        }
        forward(controller: "home", action: "index")
    }

    def deleteTopic(Long id) {

        Topic topic = Topic.get(id)
        topic.delete(flush: true)
        flash.message = "Topic is successfully deleted!"
        redirect(controller: "home", action: "dashboard")
    }
}
