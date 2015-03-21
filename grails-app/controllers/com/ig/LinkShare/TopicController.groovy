package com.ig.LinkShare

class TopicController {

    def topicSubscriptionService
    def showResourceService

    def index(Long id) {

        println(params.loginUser)

        println "--------index : topic"

        Topic topic = Topic.findById(id)



        List<Subscription> subscriptionList = topicSubscriptionService.subscriptionList(loginUser)
        subscriptionList.each { println "public  : " + it }


        List<Resource> resourceList = showResourceService.showResourcesByTopic(topic)

        if(session["username"])
        {
            User loginUser = User.get(params.loginUser)
            render(view: "/topic/topicShow", model: [topic: topic, loginUser: loginUser, subscribers: subscriptionList, resources: resourceList])
        }
        else
        {
            render(view: "/topic/topicShow", model: [topic: topic,subscribers: subscriptionList, resources: resourceList])
        }

    }

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

    def updateTopic(Long id) {
        println ".........................in update topic"
        println "------ ${params}"
        println id

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
        println "........... in update resource"
        println "---------${params}"

        Resource resource=Resource.get(id)
        resource.description=params.description

        resource.save(failOnError: true,flush: true)

        if(resource.save(failOnError: true,flush: true)){
            flash.message = "Resource have been successfully edited to : ${resource.description}!"
        }
        else
        {
            flash.message="Resource editing failed!"
        }
        forward(controller: "showPost",action: "index")
    }

    def deleteTopic(Long id) {
        println "-------------${params}"
        Topic topic = Topic.load(id)
        topic.delete(flush: true)
        r
        forward(controller: "home", action: "dashboard")
    }
}
