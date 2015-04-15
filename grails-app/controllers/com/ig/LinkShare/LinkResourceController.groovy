package com.ig.LinkShare

class LinkResourceController {
    def scaffold = true
    def readingItemService
    def springSecurityService

    def shareLink() {
        User userID =springSecurityService.currentUser

        Topic topicID = Topic.findWhere(createdBy: userID, topicName: params.topicList)

        LinkResource linkResource = new LinkResource(linkUrl: params.link, description: params.desc)
        topicID.addToResources(linkResource)
        userID.addToResources(linkResource)

        if (linkResource.save(failOnError: true)) {
            readingItemService.markReading(userID, linkResource, true)

            flash.message = "Your link has been created !"
        } else {
            flash.message = "Sorry , link creating failed !"
        }
        redirect(controller: "home", action: "dashboard")
    }

}
