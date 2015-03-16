package com.ig.LinkShare

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

        if (readingItem.save(failOnError: true, flush: true)) {
            flash.message = "Resource is read now"
            render(template: "/myTemplates/inboxPanelBody",model:['unreadItem':readingItem,loginUser:currentUser] )
            //render(template: "/myTemplates/markAsRead", model: [currentUser: params.currentUser, currentResource: params.currentResource])
        } else {
            flash.message = "Resource is still unread"
//            render(template: "/myTemplates/markAsUnread", model: [currentUser: params.currentUser, currentResource: params.currentResource])

        }
//        forward(controller: "home",action: "dashboard")
    }

    def demo() {
        println " only this shud be called----------------demo action"
//       int a=10
//        int b=20
//        int sum= a+b
        render "testing"
    }

}
