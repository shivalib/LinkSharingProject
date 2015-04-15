package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Seriousness
import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TopicSubscriptionService {

    ReadingItemService readingItemService

        //user get automatically subscribe to topic
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

    List<Subscription> subscriptionListOfCurrentTopic(Topic topic){
        List<Subscription> subscriptions=Subscription.createCriteria().list {
            eq('topic',topic)
        }
        return  subscriptions
    }

    List<Subscription> currentUserSubscriptions(User user){
        List<Subscription> subscriptions=Subscription.createCriteria().list {
            eq('user',user)
            'topic'{
                eq('createdBy',user)
            }
        }
        return subscriptions
    }

    List<Topic> showTop5Subscription(User user) {
        List<Topic> topics = Topic.createCriteria().list() {
            'subscriptions' {
                eq('user', user)
            }
            eq('visibility', Visibility.PUBLIC)
        }
        return topics
    }

    def userSubscriptions(User currentUser, def max, def offset) {
        List<Subscription> subscriptions = Subscription.createCriteria().list(max: max, offset: offset) {

            eq('user', currentUser)
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }

        }
        return subscriptions
    }

    def userSubscriptionsOnTopicsCreated(User currentUser, def max, def offset) {

        List<Subscription> subscriptions = Subscription.createCriteria().list(max: max, offset: offset) {
            'topic'{
                eq('createdBy',currentUser)
            }
            eq('user', currentUser)
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        return subscriptions
    }
}
