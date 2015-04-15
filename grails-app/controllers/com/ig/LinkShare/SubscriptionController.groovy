package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_USER'])
class SubscriptionController {
    def scaffold = Subscription

    def userService
    def readingItemService
    def searchService
    def showTopicService
    def topicSubscriptionService
    def springSecurityService

    def showAllSubscriptions() {

        User currentUser =springSecurityService.currentUser
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Subscription> subscriptions = topicSubscriptionService.userSubscriptions(currentUser, max, offset)
        int total = subscriptions.totalCount

        render(view: "topicSubscription", model: [loginUser: currentUser, subscriptions: subscriptions, topicList: topics, max: max, offset: offset, subscriptionCount: total])
    }

    def showAllTopicsCreated() {
        User currentUser =springSecurityService.currentUser
        List<Topic> topics = showTopicService.findTopicsCreatedByUser(currentUser)

        render(view: "topicSubscription", model: [loginUser: currentUser,topicList:topics])
    }

    def paginate() {
        User currentUser = User.get(session["userID"])

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Subscription> subscriptions = Subscription.createCriteria().list([max: max, offset: offset]) {
            eq('user', currentUser)
        }

        render(view: "_allSubscription", model: [loginUser: currentUser, subscriptions: subscriptions, subscriptionCount: subscriptions.totalCount, max: max, offset: offset])
    }

    def subscribeUser() {

        User currentUser = User.get(session["userID"])

        def topicName = params.topicName

        Topic topic = Topic.findByTopicName(topicName)

        Subscription subscription = new Subscription(seriousness: params.seriousness, user: currentUser, topic: topic)
        if (subscription.save(failOnError: true)) {
            List<Resource> resourceListOfCurrentUser = Resource.findAllWhere(topic: topic)

            resourceListOfCurrentUser.each { Resource resource ->
                readingItemService.markReading(currentUser, resource, false)
            }
            currentUser.addToSubscriptions(subscription)
            topic.addToSubscriptions(subscription)

            flash.message = "You have been successfully subscribed to ${topicName} !"
        } else {
            flash.message = "Sorry, subscription failed !"
            subscription.errors.allErrors.each { println it }
        }
        redirect(controller: "home", action: "dashboard")

    }

    def unsubscribeUser() {

        User currentUser =User.get(session["userID"])

        def topicName = params.topicName
        Topic topic = Topic.findByTopicName(topicName)

        Subscription subscription = Subscription.findByUserAndTopic(currentUser, topic)

    }

    def changeVisibility() {
        Topic topic = Topic.get(params.topicID)
        topic.visibility = params.visibility
        topic.save(failOnError: true, flush: true)

        if (topic.visibility == Visibility.PUBLIC) {
            render false
        } else {
            render true
        }
    }

    def changeSeriousness() {
        Subscription subscription = Subscription.get(params.subscribeID)
        subscription.seriousness = params.seriousness
        subscription.save(failOnError: true, flush: true)
        render true
    }


}
