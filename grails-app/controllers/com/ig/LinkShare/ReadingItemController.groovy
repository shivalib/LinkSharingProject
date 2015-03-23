package com.ig.LinkShare

import grails.converters.JSON

class ReadingItemController {

    def markAsReadOrUnread() {

        User currentUser = User.findById(params.currentUser)

        Resource resource = Resource.findById(params.currentResource)

        ReadingItem readingItem = ReadingItem.findByUserAndResource(currentUser, resource)

        readingItem.isRead = !readingItem.isRead

        def appResult
        if (readingItem.save(failOnError: true, flush: true)) {

            appResult = [result: true]
//            render(template: "/myTemplates/inboxPanelBody",model:['unreadItem':readingItem,loginUser:currentUser] )
        } else {

            appResult = [result: false]
        }

        render appResult as JSON
    }


}
