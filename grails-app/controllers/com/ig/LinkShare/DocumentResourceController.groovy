package com.ig.LinkShare

class DocumentResourceController {

    def scaffold = true
    //def index() {}
    def uploadService
    def readingItemService

    def shareDocument() {
        User createdBy = User.findWhere(username: session["username"])
//        println "username : " +createdBy.username

        Topic topic = Topic.findWhere(topicName: params.topic)
//        println "topic name : "+topic.topicName

        DocumentResource documentResource = new DocumentResource(description: params.description)
        topic.addToResources(documentResource)
        createdBy.addToResources(documentResource)

        documentResource=uploadService.uploadDocument(documentResource,params.docFile,grailsApplication.config.upload.uploadDocument)

        if(documentResource.save(failOnError: true))
        {

            readingItemService.markReading(createdBy,documentResource,true)

            flash.message = "Your Document has been shared !"
        }

        else {
            flash.message = "Sorry , link sharing failed !"
        }

        //todo: replace this redirect - render using ajax
        redirect(controller: "home",action: "dashboard")

    }
}
