package com.ig.LinkShare

import grails.converters.JSON

class ReadingItemController {

    def markAsReadOrUnread() {

        User currentUser = User.findById(params.currentUser)

        Resource resource = Resource.findById(params.currentResource)

        ReadingItem readingItem = ReadingItem.findByUserAndResource(currentUser, resource)

        readingItem.isRead = !readingItem.isRead

        readingItem.save(failOnError: true, flush: true)
        render(template: "/showPost/topicPost",model: [resourceList:readingItem.resource,loginUser:currentUser])

    }

    def markAsReadOrUnreadForTopicClick() {

        User currentUser = User.findById(params.currentUser)

        Resource resource = Resource.findById(params.currentResource)

        ReadingItem readingItem = ReadingItem.findByUserAndResource(currentUser, resource)

        readingItem.isRead = !readingItem.isRead

        readingItem.save(failOnError: true, flush: true)
        render(template: "/subscription/markReadOrUnreadOnTopicClick",model: [resources:readingItem.resource,loginUser:currentUser])

    }



}
