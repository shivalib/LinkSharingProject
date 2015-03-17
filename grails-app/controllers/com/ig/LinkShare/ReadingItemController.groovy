package com.ig.LinkShare

import grails.converters.JSON

class ReadingItemController {

    def markAsReadOrUnread() {
        println "************in mark as read***************"
        println "------------ $params"

        println "^^^^^^^^^^^^ current user : " + params.currentUser
        println "^^^^^^^^^^^^ current resource : " + params.currentResource

        User currentUser = User.findById(params.currentUser)
        println currentUser.firstName

        Resource resource = Resource.findById(params.currentResource)
        println resource.description

        ReadingItem readingItem = ReadingItem.findByUserAndResource(currentUser, resource)
        println readingItem.isRead

        readingItem.isRead = !readingItem.isRead

        println readingItem.isRead

        def appResult
        if (readingItem.save(failOnError: true, flush: true)) {

            appResult=[result: true]
//            render(template: "/myTemplates/inboxPanelBody",model:['unreadItem':readingItem,loginUser:currentUser] )
        } else {

            appResult=[result: false]
        }

        render appResult as JSON
    }

    def demo() {
        println " only this shud be called----------------demo action"
//       int a=10
//        int b=20
//        int sum= a+b
        render "testing"
    }

}
