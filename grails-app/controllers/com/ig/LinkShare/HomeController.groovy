package com.ig.LinkShare

class HomeController {

    def top5SubscriptionService

    def trendingTopicService
    def showInboxService
    def showTopicService
    def userService

    def index() {

        List<Resource> resources = Resource.list([max: 5, offset: 0, order: "desc", sort: "id"])
        println ">>>>>>>>>>>>>>>>>>>>>>>.index"
        println ">>>>>>>>>>>>>>>>>>>>>>>.Home"

        render(view: "/user/HomePage", model: [resources: resources])

    }
//
    def dashboard() {
        if (session["username"]) {

//         todo   Replace this with service

            User currentUser = userService.showCurrentUserObject(session["username"])

            List<Topic> topics =showTopicService.findTopicsOfCurrentUser(session["username"])

            List<Subscription> subscriptionList = Subscription.findAllByUser(currentUser)
//            subscriptionList=subscriptionList.subList(0,5)

            //show trending topics
            List<Topic> trendingTopics=trendingTopicService.showTrendingTopics()

            //show Inbox
            List<ReadingItem> readingItemListWithIsReadFalse=showInboxService.showInbox(session["username"])


            List<Topic> top5SubscribedTopics=top5SubscriptionService.showTop5Subscription(session["username"])
            top5SubscribedTopics.each {
                println "-----------------in criteria :"
                println "Topic name : " + it.topicName
                println "Post count : " +it.resources.size()
                println "Subscriptions : " +it.subscriptions.size()
            }
            
            render(view: "/user/Dashboard", model: [readingItemListWithIsReadFalse:readingItemListWithIsReadFalse,loginUser: currentUser, trendingTopicList: trendingTopics, topicList: topics.topicName, top5SubscribedTopics: top5SubscribedTopics])
        }
    }

}
