package com.ig.LinkShare

class HomeController {

    def top5SubscriptionService

    def trendingTopicService
    def showInboxService
    def showTopicService
    def userService
    def showResourceService

    def index() {

        List<Resource> resources = showResourceService.calculateResourceList()

        render(view: "/login/homePage", model: [resources: resources, resourceCount: resources.count])
    }

    def dashboard() {
        if (session["username"]) {

            User currentUser = userService.showCurrentUserObject(session["username"])

            List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(session["username"])

            int offset = params.offset ? params.int('offset') : 0
            int max = params.max ? params.int('max') : 5

            //show trending topics
            List<Topic> trendingTopics = trendingTopicService.showTrendingTopics(max, offset)
            int totalTopic = trendingTopics.size()

            //show Inbox
            List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["username"], max, offset)
            int total = readingItemListWithIsReadFalse.totalCount

            //show top5Subscriptions
            List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"], max, offset)
            int subscriptionCount = top5SubscribedTopics.totalCount

            render(view: "/home/dashboard", model: [subscriptionCount: subscriptionCount, inboxCount: total, max: max, offset: offset, trendingCount: totalTopic, readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, loginUser: currentUser, trendingTopicList: trendingTopics, topicList: topics.topicName, top5SubscribedTopics: top5SubscribedTopics])
        }
    }

    def showTopPosts(){
        println "********** selected value : "+params.timeValue
        List<Resource> resources1 = showResourceService.showTopPost(params.timeValue)
        resources1.each{
            println it
        }
        render true

    }


    def paginateUserSubscription() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        //show top5Subscriptions
        List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"], max, offset)
        int subscriptionCount = top5SubscribedTopics.totalCount

        render(template: "/home/subscriptionOfCurrentUser", model: [top5SubscribedTopics: top5SubscribedTopics, subscriptionCount: subscriptionCount, max: max, offset: offset])
    }

    def showRecentShare() {

        List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"])
        render(template: "/home/subscriptionOfCurrentUser", model: [top5SubscribedTopics: top5SubscribedTopics])
    }

    def paginateInbox() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["username"], max, offset)
        int total = readingItemListWithIsReadFalse.totalCount

        render(template: "/dashboard/iterateInbox", model: [readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, inboxCount: total, max: max, offset: offset])
    }

    def paginateTrendingTopics() {

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics(max, offset)
        int totalTopic = trendingTopics

        render(template: "/dashboard/trendingTopics", model: [trendingTopicList: trendingTopics, trendingCount: totalTopic, max: max, offset: offset])
    }

}
