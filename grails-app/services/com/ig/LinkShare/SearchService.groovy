package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class SearchService {
    UserService userService
    //todo try not using def in service.

    def userSubscriptions(User currentUser,def max,def offset){

        List<Subscription> subscriptions = Subscription.createCriteria().list(max: max, offset: offset) {

            eq('user', currentUser)
            'topic'{
                eq('visibility',Visibility.PUBLIC)
            }

        }

        return subscriptions

    }
}
