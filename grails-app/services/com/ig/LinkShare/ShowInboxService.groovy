package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowInboxService {

    def userService


    List<ReadingItem> showInbox(String currentUser){

        User user=User.findByUsername(currentUser)

        List<ReadingItem> readingItems=ReadingItem.createCriteria().list(offset:0,max:5) {
            eq('isRead',false)
            eq('user',user)

        }
    }

}
