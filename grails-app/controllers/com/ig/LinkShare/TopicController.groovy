package com.ig.LinkShare

class TopicController {

    def topicSubscriptionService
    def showResourceService

    def index(Long id) {

        println(params.loginUser)

        println "--------index : topic"

        Topic topic=Topic.findById(id)

        User loginUser=User.get(params.loginUser)

        List<Subscription> subscriptionList=topicSubscriptionService.subscriptionList(topic)
        List<Resource> resourceList=showResourceService.showresourcesByTopic(topic)

        render(view: "/user/TopicShow",model: [topic: topic,loginUser:loginUser,subscribers:subscriptionList,resources:resourceList])
    }


    //todo remove the objects which are never used and optimise redirects
    def createTopic(User user) {

        User userID = User.findWhere(username: session["username"])
        println userID

        Topic topic1 = new Topic(topicName: params.topicName, createdBy: userID, visibility: params.topicType)

        if (topic1.save(failOnError: true)) {

            userID.addToTopics(topic1)

            Subscription subscribe = topicSubscriptionService.subscribeTopic(userID, topic1)

            flash.message = "Your topic has been created!"
        } else {
            flash.message = "Sorry, topic creation failed!"
        }
        redirect(controller: "home", action: "dashboard")
    }
}
