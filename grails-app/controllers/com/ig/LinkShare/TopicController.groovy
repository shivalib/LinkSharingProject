package com.ig.LinkShare

class TopicController {

    def topicSubscriptionService
    def showResourceService
    def userService
    def showTopicService

    def index(Long id) {

        Topic topic = Topic.findById(id)

        User loginUser = User.get(params.loginUser)

        List<Subscription> subscriptionList = topicSubscriptionService.subscriptionListOfCurrentTopic(topic)

        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(loginUser)

        List<Resource> resourceList = showResourceService.showResourcesByTopic(topic)


        render(view: "/topic/topicShow", model: [topic: topic, topicList: topics.topicName, loginUser: loginUser, subscribers: subscriptionList, resources: resourceList])


    }

    def createTopic() {
        User userID = User.findWhere(username: session["username"])

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

        Topic topic = Topic.load(id)
        topic.delete(flush: true)
        forward(controller: "home", action: "dashboard")
    }
}
