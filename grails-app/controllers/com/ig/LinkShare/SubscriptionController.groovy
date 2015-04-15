package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class SubscriptionController {
    def scaffold = Subscription

    def readingItemService
    def searchService
    def showTopicService
    def topicSubscriptionService
    def springSecurityService

    def showAllSubscriptions() {

        User currentUser = springSecurityService.currentUser
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Subscription> subscriptions = topicSubscriptionService.userSubscriptions(currentUser, max, offset)
        int total = subscriptions.totalCount

        render(view: "topicSubscription", model: [loginUser: currentUser, subscriptions: subscriptions, topicList: topics, max: max, offset: offset, subscriptionCount: total])
    }

    def subscribeUser() {

        User currentUser = springSecurityService.currentUser

        Topic topic = Topic.findByTopicName(params.topicName)

        Subscription subscription = new Subscription(seriousness: params.seriousness)
        currentUser.addToSubscriptions(subscription)
        topic.addToSubscriptions(subscription)

        if (subscription.save(failOnError: true)) {

            List<Resource> resourceListOfCurrentUser = Resource.findAllWhere(topic: topic)

            resourceListOfCurrentUser.each { Resource resource ->
                readingItemService.markReading(currentUser, resource, false)
            }

            flash.message = "You have been successfully subscribed to ${params.topicName} !"
        } else {
            flash.message = "Sorry, subscription failed !"
            subscription.errors.allErrors.each { println it }
        }
        redirect(controller: "home", action: "dashboard")

    }

    def unSubscribeUser(Long id) {

        User currentUser = springSecurityService.currentUser
        Topic topic = Topic.get(id)

        Subscription subscription = Subscription.findByUserAndTopic(currentUser, topic)
        subscription.delete(flush: true)

        flash.message = "You have been successfully unsubscribed from topic : ${topic.topicName} "

        redirect(controller: 'topic', action: 'index', id: topic.id)
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
