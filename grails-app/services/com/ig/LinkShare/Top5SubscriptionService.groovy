package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class Top5SubscriptionService {
    //todo try not using def in service.

    List<Topic> showTop5Subscription(String currentUser){

        User user=User.findByUsername(currentUser)

        List<Topic> topics=Topic.createCriteria().list(offset:0,max:5) {
//          projections {
//              count("subscriptions")
//          }
            'subscriptions'{
              eq('user',user)
          }

        }
        return  topics
    }


}
