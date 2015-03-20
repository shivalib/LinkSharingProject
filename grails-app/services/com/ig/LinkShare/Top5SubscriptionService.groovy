package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class Top5SubscriptionService {


    List<Topic> showTop5Subscription(String currentUser){

        User user=User.findByUsername(currentUser)

        List<Topic> topics=Topic.createCriteria().list(offset:0,max:5) {
//          projections {
//              count("subscriptions")
//          }
            'subscriptions'{
              eq('user',user)
          }
            eq('visibility',Visibility.PUBLIC)

        }
        return  topics
    }


}
