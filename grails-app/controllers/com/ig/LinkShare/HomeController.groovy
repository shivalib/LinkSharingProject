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

        render(view: "/login/homePage", model: [resources: resources])

    }

    def dashboard() {
        if (session["username"]) {

            User currentUser = userService.showCurrentUserObject(session["username"])

            List<Topic> topics = showTopicService.findTopicsOfCurrentUser(session["username"])

            //show trending topics
            List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

            //show Inbox
            List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["username"])

            //show top5Subscriptions
            List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"])

            render(view: "/home/dashboard", model: [readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, loginUser: currentUser, trendingTopicList: trendingTopics, topicList: topics.topicName, top5SubscribedTopics: top5SubscribedTopics])
        }
    }

    def showRecentShare(){
        //show top5Subscriptions
        List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"])

        render(template: "/home/remotePaginate",model: [top5SubscribedTopics: top5SubscribedTopics])
    }

}
