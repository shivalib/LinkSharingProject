package com.ig.LinkShare

import LinkShareEnums.Seriousness
import grails.transaction.Transactional

@Transactional
class TopicSubscriptionService {

    ReadingItemService readingItemService

    def serviceMethod() {
    }

    //subscribe topic
    Subscription subscribeTopic(User user, Topic topic) {
        Subscription subscription = new Subscription(seriousness:Seriousness.VERYSERIOUS, user: user, topic: topic)
        if (subscription.save(flush: true, failOnError: true)) {

            user.addToSubscriptions(subscription)
            topic.addToSubscriptions(subscription)
        }
        else {
            subscription.errors.allErrors.each {println it}
        }
        return subscription
    }
}
