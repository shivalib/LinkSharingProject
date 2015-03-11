package com.ig.LinkShare

class DocumentResourceController {

    def scaffold = true
    //def index() {}

    def readingItemService

    def shareDocument()
    {
        User userID=User.findWhere(username:  session["username"])
        println userID

        def topicID=Topic.findWhere(createdBy: userID, topicName: params.topicList)
        println topicID.topicName

        DocumentResource documentResource=new DocumentResource(fileName: params.docName,filePath: params.docFile,description: params.desc, createdBy: userID,topic: topicID)

        if(documentResource.save(failOnError: true))
        {
            topicID.addToResources(documentResource)
            userID.addToResources(documentResource)

            readingItemService.markReading(userID,documentResource,true)

            flash.message = "Your Document has been shared !"
        }

        else {
            flash.message = "Sorry , link sharing failed !"
        }

        redirect(controller: "home",action: "dashboard")

    }
}
