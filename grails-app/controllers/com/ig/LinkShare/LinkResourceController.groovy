package com.ig.LinkShare

class LinkResourceController {
    def scaffold = true
    //def index() {}
    def readingItemService

    def shareLink(User user)
    {
        User userID=User.findWhere(username:  session["username"])
        println userID

        def topicID=Topic.findWhere(createdBy: userID, topicName: params.topicList)
        println topicID.topicName

        LinkResource linkResource=new LinkResource(linkUrl: params.link,description: params.desc,createdBy: userID,topic:topicID)

        if(linkResource.save(failOnError: true))
        {
            topicID.addToResources(linkResource)
            userID.addToResources(linkResource)

            readingItemService.markReading(userID,linkResource,true)


            flash.message = "Your link has been created !"
        }
        else {
            flash.message = "Sorry , link creating failed !"
        }

        //todo: replace this redirect - render using ajax
        redirect(controller: "home",action: "dashboard")
    }

}
