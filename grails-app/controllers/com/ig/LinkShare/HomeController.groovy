package com.ig.LinkShare

class HomeController {

    def top5SubscriptionService

    //def trendingTopicService
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

            List<Topic> trendingTopicList = Topic.list().sort { it.resources.size() }.reverse()
//            trendingTopicList=trendingTopicList.subList(0,5)

            //show Inbox
            List<ReadingItem> readingItemListWithIsReadFalse=showInboxService.showInbox(session["username"])
//
//            List<Topic> topics1=top5SubscriptionService.showTop5Subscription(session["username"])
//
//            topics1.each {
//                println it.topicName
//            }
            render(view: "/user/Dashboard", model: [readingItemListWithIsReadFalse:readingItemListWithIsReadFalse,loginUser: currentUser, trendingTopicList: trendingTopicList, topicList: topics.topicName, subscriptionList: subscriptionList])
        }
    }

}
