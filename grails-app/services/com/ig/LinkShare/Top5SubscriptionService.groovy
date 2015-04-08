package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class Top5SubscriptionService {


    List<Topic> showTop5Subscription(def userID, int max, int offset) {

        User user = User.get(userID)

        List<Topic> topics = Topic.createCriteria().list(offset: offset, max: max) {
            'subscriptions' {
                eq('user', user)
            }
            eq('visibility', Visibility.PUBLIC)
        }
        return topics
    }


}
