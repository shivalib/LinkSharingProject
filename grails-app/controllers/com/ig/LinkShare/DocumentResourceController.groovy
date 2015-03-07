package com.ig.LinkShare

class DocumentResourceController {

    def scaffold = true
    //def index() {}

    def readingItemService

    def shareDocument()
    {
        User userID=User.findWhere(username:  session["username"])
        println userID

        Topic topic=Topic.findWhere(createdBy: userID)
        println topic

        def topicID=topic.findWhere(topicName: params.topicList)

        DocumentResource documentResource=new DocumentResource(fileName: params.docName,filePath: params.docFile,description: params.desc, createdBy: userID,topic: topicID)

        if(documentResource.save(failOnError: true))
        {
            topic.addToResources(documentResource)

            readingItemService.markReading(userID)

            flash.message = "Your Document has been shared !"
        }

        else {
            flash.message = "Sorry , link sharing failed !"
        }

        redirect(controller: "home",action: "dashboard")

    }
}
