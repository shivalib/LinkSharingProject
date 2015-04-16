package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class LinkResourceController {
    def scaffold = true
    def readingItemService
    def springSecurityService

    def shareLink() {
        User user = springSecurityService.currentUser
        Topic topic = Topic.findWhere(createdBy: user, topicName: params.topicList)

        LinkResource linkResource = createLinkResource(user, topic)

        if (linkResource.save(failOnError: true)) {
            readingItemService.markReading(user, linkResource, true)
            flash.message = "Your link has been created !"
        } else {
            flash.message = "Sorry , link creating failed !"
        }
        redirect(controller: "home", action: "dashboard")
    }

    def createLinkResource(User user, Topic topic) {
        LinkResource linkResource = new LinkResource(linkUrl: params.link, description: params.desc)
        topic.addToResources(linkResource)
        user.addToResources(linkResource)
        return linkResource
    }

}
