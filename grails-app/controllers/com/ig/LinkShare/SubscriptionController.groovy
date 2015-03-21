package com.ig.LinkShare

class SubscriptionController {
    def userService
//    todo move the all the possible code to a service and optimize your redirects

    def scaffold = Subscription
    def readingItemService
    def searchService
    def showTopicService



    def showAllSubscriptions() {

        User currentUser = userService.showCurrentUserObject(session["username"])
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(session["username"])

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5


        List<Subscription> subscriptions = searchService.userSubscriptions(currentUser, max, offset)
        int total = subscriptions.totalCount

        render(view: "topicSubscription", model: [loginUser: currentUser, subscriptions: subscriptions,topicList:topics.topicName, max: max, offset: offset, subscriptionCount: total])
    }

    def paginate() {
        User currentUser = userService.showCurrentUserObject(session["username"])

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 2

        List<Subscription> subscriptions = Subscription.createCriteria().list([max: max, offset: offset]) {

            eq('user', currentUser)

        }

        render(view: "_allSubscription", model: [loginUser: currentUser, subscriptions: subscriptions, subscriptionCount: subscriptions.totalCount, max: max, offset: offset])
    }

    def subscribeUser() {

        String loginUser = session["username"]

        User currentUser = User.findByUsername(loginUser)

        def topicName = params.topicName

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
        } else {
            flash.message = "Sorry, subscription failed !"
            subscription.errors.allErrors.each { println it }
        }
        redirect(controller: "home", action: "dashboard")

    }

    def unsubscribeUser() {

        String loginUser = session["username"]
        User currentUser = User.findByUsername(loginUser)
        println "-------------User Name : " + currentUser

        def topicName = params.topicName
        println "-------------Topic Name : " + topicName

        Topic topic = Topic.findByTopicName(topicName)

        Subscription subscription = Subscription.findByUserAndTopic(currentUser, topic)
        println subscription.user
    }

    def changeVisibility() {
        println "---ready to change visibility!!!!!!!!!!!!!!!!"

        Topic topic=Topic.get(params.topicID)
        println topic.topicName
        println params.visibility
        topic.visibility=params.visibility
        topic.save(failOnError: true,flush: true)
        render "tadaaaaaaaaaan !"
//        topic.visibility = params.visibility
//        topic.save(failOnError: true, flush: true)
    }

}
