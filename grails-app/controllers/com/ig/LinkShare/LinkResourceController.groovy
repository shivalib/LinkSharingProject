package com.ig.LinkShare

class LinkResourceController {
    def scaffold = true
    //def index() {}
    def readingItemService

    def shareLink(User user)
    {
        User userID=User.findWhere(username:  session["username"])
        println userID

        Topic topic=Topic.findWhere(createdBy: userID)
        println topic

        def topicID=topic.findWhere(topicName: params.topicList)
        println topicID.topicName

        LinkResource linkResource=new LinkResource(linkUrl: params.link,description: params.desc,createdBy: userID,topic:topicID)

        if(linkResource.save(failOnError: true))
        {
            topicID.addToResources(linkResource)

            readingItemService.markReading(userID)

            flash.message = "Your link has been created !"
        }
        else {
            flash.message = "Sorry , link creating failed !"
        }
        redirect(controller: "home",action: "dashboard")
    }

}
