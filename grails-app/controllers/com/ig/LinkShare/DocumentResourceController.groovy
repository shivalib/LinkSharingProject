package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class DocumentResourceController {

    def scaffold = true
    def uploadService
    def readingItemService
    def springSecurityService

    def shareDocument() {
        User createdBy = springSecurityService.currentUser
        Topic topic = Topic.findWhere(topicName: params.topic)

        DocumentResource documentResource=createNewDocumentResource(createdBy,topic)
        documentResource = uploadService.uploadDocument(documentResource, params.docFile, grailsApplication.config.upload.uploadDocument)

        if (documentResource.save(failOnError: true)) {
            readingItemService.markReading(createdBy, documentResource, true)
            flash.message = "Your Document has been shared !"
        } else {
            flash.message = "Sorry , link sharing failed !"
        }
        redirect(controller: "home", action: "dashboard")

    }

    def createNewDocumentResource(User user,Topic topic){
        DocumentResource documentResource = new DocumentResource(description: params.description)
        topic.addToResources(documentResource)
        user.addToResources(documentResource)
        return documentResource
    }

    def downloadResource() {
        DocumentResource documentResource = DocumentResource.get(params.resource)
        if (documentResource == null) {
            flash.message = "File not found!"
            redirect(controller: "home", action: "dashboard")
        } else {
            File file = new File(documentResource.filePath)
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${documentResource.fileName}\"")
            def outputStream = response.getOutputStream()
            outputStream << file.getBytes()
            outputStream.flush()
            outputStream.close()
        }
    }
}
