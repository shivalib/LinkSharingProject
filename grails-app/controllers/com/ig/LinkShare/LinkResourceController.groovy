package com.ig.LinkShare

class LinkResourceController {
    def scaffold = true
    def readingItemService

    def shareLink() {
        User userID =User.get(session["userID"])

        def topicID = Topic.findWhere(createdBy: userID, topicName: params.topicList)

        LinkResource linkResource = new LinkResource(linkUrl: params.link, description: params.desc, createdBy: userID, topic: topicID)

        if (linkResource.save(failOnError: true)) {
            topicID.addToResources(linkResource)
            userID.addToResources(linkResource)

            readingItemService.markReading(userID, linkResource, true)

            flash.message = "Your link has been created !"
        } else {
            flash.message = "Sorry , link creating failed !"
        }
        redirect(controller: "home", action: "dashboard")
    }

}
