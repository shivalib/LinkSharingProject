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

        Topic topic1=new Topic(topicName: params.topicName,createdBy: userID,visibility: params.topicType)

        if(topic1.save(failOnError: true)) {
            userID.addToTopics(topic1)

            flash.message = "Your topic has been created !"
        }
        else {
            flash.message = "Sorry , topic creation failed !"
        }
        redirect(controller: "home",action: "dashboard")

    }

    def createLink(User user)
    {
        User userID=User.findWhere(username:  session["username"])
        println userID

        Topic topic=Topic.findWhere(createdBy: userID)
        println topic

        def topicID=topic.findWhere(topicName: params.topicList)
        LinkResource linkResource=new LinkResource(linkUrl: params.link,description: params.desc,createdBy: userID,topic:topicID)

        if(linkResource.save(failOnError: true))
        {
            topic.addToResources(linkResource)
            flash.message = "Your link has been created !"
        }
        else {
            flash.message = "Sorry , link creation failed !"
        }
        redirect(controller: "home",action: "dashboard")

    }

}
