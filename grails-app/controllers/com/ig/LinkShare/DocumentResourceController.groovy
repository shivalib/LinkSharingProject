package com.ig.LinkShare

import javax.print.Doc

class DocumentResourceController {

    def scaffold = true
    //def index() {}
    def uploadService
    def readingItemService

    def shareDocument() {
        User createdBy = User.findWhere(username: session["username"])

        Topic topic = Topic.findWhere(topicName: params.topic)

        DocumentResource documentResource = new DocumentResource(description: params.description)
        topic.addToResources(documentResource)
        createdBy.addToResources(documentResource)

        documentResource = uploadService.uploadDocument(documentResource, params.docFile, grailsApplication.config.upload.uploadDocument)

        if (documentResource.save(failOnError: true)) {

            readingItemService.markReading(createdBy, documentResource, true)

            flash.message = "Your Document has been shared !"
        } else {
            flash.message = "Sorry , link sharing failed !"
        }

        //todo: replace this redirect - render using ajax
        redirect(controller: "home", action: "dashboard")

    }

    def downloadResource(){
        DocumentResource documentResource=DocumentResource.get(params.resource)
        if(documentResource==null){
            flash.message="File not found!"
            redirect(controller: "home",action: "dashboard")
        }
        else
        {
            File file=new File(documentResource.filePath)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentResource.fileName}\"")
            def outputStream = response.getOutputStream()
            outputStream << file.getBytes()
            outputStream.flush()
            outputStream.close()
        }

    }
}
