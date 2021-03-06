package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class TopicController {

    def topicSubscriptionService
    def resourceService
    def topicService
    def springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index(Long id) {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 10

        Topic topic = Topic.get(id)
        User loginUser = springSecurityService.currentUser

        List<Subscription> subscriptionList = topicSubscriptionService.subscriptionListOfCurrentTopic(topic, max, offset)
        def subscribersCount = subscriptionList.totalCount

        List<Topic> topics = topicService.findTopicsSubscribedByCurrentUser(loginUser)
        List<Resource> resourceList = resourceService.showResourcesByTopic(topic)

        render(view: "/topic/topicShow", model: [subscribersCount: subscribersCount, max: max, offset: offset, topic: topic, topicList: topics, loginUser: loginUser, subscribers: subscriptionList, resources: resourceList])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def paginateSubscribersOfTopic(Long id) {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 10

        Topic topic = Topic.get(id)
        User loginUser = springSecurityService.currentUser

        List<Subscription> subscriptionList = topicSubscriptionService.subscriptionListOfCurrentTopic(topic, max, offset)
        def subscribersCount = subscriptionList.totalCount

        render(template: 'subscribersOfTopic', model: [loginUser: loginUser, subscribers: subscriptionList, subscribersCount: subscribersCount, max: max, offset: offset])
    }

    def paginatePostsOfTopic(Long id){
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 10

        Topic topic = Topic.get(id)
        List<Resource> resourceList = resourceService.showResourcesByTopic(topic)


    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def showTopicList() {
        User currentUser = springSecurityService.currentUser
        List<Topic> topicsCreatedByUser = topicService.findTopicsCreatedByUser(currentUser)

        render(view: "topicList", model: [loginUser: currentUser, topicList: topicsCreatedByUser])
    }

    @Secured(['ROLE_ADMIN'])
    def topicListForAdmin() {
        User currentUser = springSecurityService.currentUser
        List<Topic> topicList = Topic.list()
        render(view: "topicList", model: [loginUser: currentUser, topicList: topicList])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createTopic() {
        User userID = springSecurityService.currentUser
        List<Topic> topicList = topicService.findTopicsNameCreatedByUser(userID)

        if (topicList.contains(params.topicName)) {
            flash.message = "Topic creation failed,topic with name : ${params.topicName} already exists!"
        } else {
            def topic1 = createNewTopicObject(userID)

            if (topic1.save(failOnError: true)) {
                topicSubscriptionService.subscribeTopic(userID, topic1)
                flash.message = "Your topic has been created!"
            } else {
                flash.message = "Sorry, topic creation failed!"
            }
        }
        redirect(controller: "home", action: "dashboard")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createNewTopicObject(User user) {
        Topic topic1 = new Topic(topicName: params.topicName, visibility: params.topicType)
        user.addToTopics(topic1)
        return topic1
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    Boolean validateTopicName() {
        List<Topic> topicList = listAllTopicNames()
        if (topicList.contains(params.topicName))
            render true
        else
            render false
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def listAllTopicNames() {
        List<Topic> topicList = Topic.createCriteria().list {
            projections {
                property("topicName")
            }
        }
        return topicList
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
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

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def updateResource(Long id) {
        Resource resource = Resource.get(id)
        resource.description = params.description
        if (resource.save(failOnError: true, flush: true)) {
            flash.message = "Resource have been successfully edited to : ${resource.description}!"
        } else {
            flash.message = "Resource editing failed!"
        }
        forward(controller: "post", action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def deleteResource(Long id) {
        Resource resource = Resource.get(id)
        if (resource.delete(failOnError: true, flush: true)) {
            flash.message = "Resource have been removed!"
        } else {
            flash.message = "Resource deletion failed!"
        }
        forward(controller: "home", action: "index")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def deleteTopic(Long id) {
        Topic topic = Topic.get(id)
        topic.delete(flush: true)
        flash.message = "Topic is successfully deleted!"
        redirect(controller: "home", action: "dashboard")
    }
}
