package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowInboxService {

    List<ReadingItem> showInbox(User user){
        List<ReadingItem> readingItems=ReadingItem.createCriteria().list() {
            eq('isRead',false)
            eq('user',user)
        }
    }

}
