package com.ig.LinkShare

import LinkShareEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TopicCreationService {

    def serviceMethod() {

    }

    def topicSubscriptionService
    def bootStrapService
    //create 5 topic for each user
    Topic createTopic(User user,Integer it)
    {
        Topic topic = new Topic(topicName: "Topic${it}", createdBy: user,visibility: Visibility.PUBLIC)


        if (topic.save(flush: true, failOnError: true)) {

            ReadingItem readingItem=new ReadingItem(user: user,isRead: true)

            user.addToReadingItems(readingItem)

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
