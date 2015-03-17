package com.ig.LinkShare

class TopicController {

    def topicSubscriptionService
    def showResourceService

    def index(Long id) {

        println(params.loginUser)

        println "--------index : topic"

        Topic topic = Topic.findById(id)

        User loginUser = User.get(params.loginUser)

        List<Subscription> subscriptionList = topicSubscriptionService.subscriptionList(topic)
        List<Resource> resourceList = showResourceService.showresourcesByTopic(topic)

        render(view: "/topic/topicShow", model: [topic: topic, loginUser: loginUser, subscribers: subscriptionList, resources: resourceList])
    }

    //todo remove the objects which are never used and optimise redirects
    def createTopic(User user) {

        User userID = User.findWhere(username: session["username"])
        println userID

        Topic topic1 = new Topic(topicName: params.topicName, visibility: params.topicType)
        userID.addToTopics(topic1)

        if (topic1.save(failOnError: true)) {

            Subscription subscribe = topicSubscriptionService.subscribeTopic(userID, topic1)

            flash.message = "Your topic has been created!"
        } else {
            flash.message = "Sorry, topic creation failed!"
        }
        redirect(controller: "home", action: "dashboard")
    }

    def updateTopic(Long id){
        println ".........................in update topic"
        println "------ ${params}"
        println id

        Topic topic=Topic.load(id)
        topic.topicName=params.topicName

        if(topic.save(failOnError: true,flush: true))
        {
            flash.message="Topic have been successfully renamed to ${topic.topicName}!"
        }
        else {
            flash.message="Topic renaming failed!"
        }
        forward(controller: "home",action: "dashboard")
    }

    def deleteTopic(Long id){
        println "-------------${params}"
        Topic topic=Topic.load(id)
        topic.delete(flush: true)

        forward(controller: "home",action: "dashboard")
    }
}
