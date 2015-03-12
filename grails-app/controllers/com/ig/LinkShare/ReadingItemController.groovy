package com.ig.LinkShare


//todo remove the unnecessary files
class ReadingItemController {

    def index() {}

    def markAsRead()
    {
        println "************in mark as read***************"
        println "------------ $params"

        User currentUser=User.findById(params.currentUser)
        println currentUser.firstName

        Resource resource=Resource.findById(params.currentResource)
        println resource.description

        ReadingItem readingItem=ReadingItem.findByUserAndResource(currentUser,resource)
        println readingItem.isRead
        readingItem.isRead=!readingItem.isRead
        println readingItem.isRead
        println readingItem.id

        if(readingItem.save(failOnError: true,flush: true))
        {
            flash.message="Resource is read now"
            forward(controller: "home",action: "dashboard")
        }

    }

}
