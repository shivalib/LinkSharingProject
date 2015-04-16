package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowInboxService {

    List<ReadingItem> showInbox(User user,def max,def offset){
        List<ReadingItem> readingItems=ReadingItem.createCriteria().list(max:max,offset:offset) {
            eq('isRead',false)
            eq('user',user)
        }
        return readingItems
    }

}
