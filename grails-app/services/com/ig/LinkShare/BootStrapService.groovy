package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class BootStrapService {

    //todo remove all the unnecessary code, commented code.
    def serviceMethod() {
    }

//    def readingItemService
//     def topicCreationService
//    //create 2 user
//    void createUser() {
//        (1..2).each {
//            User user = new User(firstName: "User${it}", lastName: "userLast${it}", username: "intelligrape${it}", password: "igdefault${it}", email: "shivalib_${it}@intelligrape.com", photo: 0, admin: false, active: false)
//            if(user.save(failOnError: true))
//            {
//                5.times {
//                    Topic topic=topicCreationService.createTopic(user,it)
//                }
//            }
//            else
//            {
//                user.errors.allErrors.each {println it}
//            }
//        }
//    }
//
//    void createResources(User user,Topic topic,Integer it)
//    {
//        DocumentResource documentResource=createDocumentResource(user,topic,it)
//        LinkResource linkResource=createLinkResource(user,topic,it)
//    }
//
//    //document resource
//    DocumentResource createDocumentResource(User user,Topic topic,Integer it)
//    {
//        DocumentResource documentResource = new DocumentResource(createdBy: user, description: "myResource", fileName: "myfile${it}",filePath: "/home/intelligrape/Documents/LinksharingRequirement.docx", topic: topic)
//        topic.addToResources(documentResource)
//        documentResource.save(flush: true,failOnError: true)
//        readingItemService.markReading(user)
//        return documentResource
//    }
//
//    //link resource
//    LinkResource createLinkResource(User user,Topic topic,Integer it)
//    {
//        LinkResource linkResource = new LinkResource(createdBy: user, description: "myResource", linkUrl: "http://www.google.com", topic: topic)
//        topic.addToResources(linkResource)
//        linkResource.save(flush: true,failOnError: true)
//        readingItemService.markReading(user)
//        return linkResource
//    }

}
