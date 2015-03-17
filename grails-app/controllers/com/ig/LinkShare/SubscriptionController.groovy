package com.ig.LinkShare

class SubscriptionController {
    def userService
    //todo move the all the possible code to a service and optimize your redirects

    def scaffold = Subscription
    // def index() {}
    def readingItemService

    def showAllSubscriptions(){
        User currentUser = userService.showCurrentUserObject(session["username"])



        render(view: "topicSubscription",model:[loginUser:currentUser])
    }


    def subscribeUser() {

        String loginUser = session["username"]
        User currentUser = User.findByUsername(loginUser)
        println "-------------User Name : " + currentUser
        def topicName = params.topicName
        println "-------------Topic Name : " + topicName
        Topic topic = Topic.findByTopicName(topicName)

        def seriousness = params.seriousness
        println params.seriousness

        Subscription subscription = new Subscription(seriousness: params.seriousness, user: currentUser, topic: topic)
        if (subscription.save(failOnError: true)) {
            List<Resource> resourceListOfCurrentUser = Resource.findAllWhere(topic: topic)

            resourceListOfCurrentUser.each { Resource resource ->
                readingItemService.markReading(currentUser, resource, false)
            }

            currentUser.addToSubscriptions(subscription)
            topic.addToSubscriptions(subscription)

            flash.message = "You have been successfully subscribed to ${topicName} !"
            redirect(controller: "home", action: "dashboard")
        } else {
            flash.message = "Sorry, subscription failed !"
            subscription.errors.allErrors.each { println it }
            redirect(controller: "home", action: "dashboard")
        }
    }

    def unsubsribeUser(){

        String loginUser = session["username"]
        User currentUser = User.findByUsername(loginUser)
        println "-------------User Name : " + currentUser

        def topicName = params.topicName
        println "-------------Topic Name : " + topicName

        Topic topic = Topic.findByTopicName(topicName)

        Subscription subscription=Subscription.findByUserAndTopic(currentUser,topic)
        println subscription.user
    }

    def changeVisibility(){
        Topic topic=Topic.get(params.long('topicID'))
        topic.visibility=params.visibility
        topic.save(failOnError: true,flush: true)
    }

}
