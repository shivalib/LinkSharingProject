package com.ig.LinkShare

import LinkShareEnums.Visibility

class TopicController {

    def index() {
        render(view: "/user/TopicShow")
    }

    def createTopic(User user)
    {

        User userID=User.findWhere(username:  session["username"])
        println userID

//        Topic topic=Topic.findWhere(createdBy: userID)

        Topic topic1=new Topic(topicName: params.topicName,createdBy: userID,visibility: params.topicType)
        

        topic1.save(failOnError: true)

        userID.addToTopics(topic1)
    }

}
