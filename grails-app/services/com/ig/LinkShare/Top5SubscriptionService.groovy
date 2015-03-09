package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class Top5SubscriptionService {

    def serviceMethod() {

    }



    List<Subscription> subscriptionList=Subscription.createCriteria().list (max:5){
        'user'{
//            eq('username','session["username"]')
            eq('username','shivali1705')
        }
//        'topic'
//              {
//                  order('lastUpdated')
//              }
    //order('dateCreated')
    }


}
