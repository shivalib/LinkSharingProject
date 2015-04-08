package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowInboxService {

    def userService


    List<ReadingItem> showInbox(def userID,int max,int offset){

        User user=User.get(userID)

        List<ReadingItem> readingItems=ReadingItem.createCriteria().list(max:max,offset:offset) {
            eq('isRead',false)
            eq('user',user)

        }
    }

}
