package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    def serviceMethod() {

    }

    def createReadingItem(User user,Topic topic)
    {
        User user1=User.findWhere(username: session["username"])

    }
}
