package com.ig.LinkShare

import LinkShareEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TopicCreationService {
    //todo try not using def in service.

    def serviceMethod() {

    }

    def topicSubscriptionService
    def bootStrapService
   // def readingItemService

    //create 5 topic for each user
    Topic createTopic(User user,Integer it)
    {
        Topic topic = new Topic(topicName: "Topic${it}", createdBy: user,visibility: Visibility.PUBLIC)
        if (topic.save(flush: true, failOnError: true)) {

            user.addToTopics(topic)
            Subscription subscribe=topicSubscriptionService.subscribeTopic(user,topic)

            5.times {
                bootStrapService.createResources(user,topic,it)
            }
        } else {
            topic.errors.allErrors.each {println it}
        }
        return topic
    }

}
