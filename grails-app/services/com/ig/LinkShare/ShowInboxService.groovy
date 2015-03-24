package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowInboxService {

    def userService


    List<ReadingItem> showInbox(String currentUser,int max,int offset){

        User user=User.findByUsername(currentUser)

        List<ReadingItem> readingItems=ReadingItem.createCriteria().list(max:max,offset:offset) {
            eq('isRead',false)
            eq('user',user)

        }
    }

}
