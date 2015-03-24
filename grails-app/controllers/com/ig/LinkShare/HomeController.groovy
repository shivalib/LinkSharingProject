package com.ig.LinkShare

class HomeController {

    def top5SubscriptionService

    def trendingTopicService
    def showInboxService
    def showTopicService
    def userService
    def showResourceService

    def index() {

        params.max = params.max ?: 5
        params.offset = params.offset ?: 0
        params.sort = params.sort ?: 'id'
        params.order = params.order ?: 'desc'

        List<Resource> resources = showResourceService.calculateResourceList()

        List<Resource> resources1 = showResourceService.showTopPost()

//        if(session["username"])
//        {
        render(view: "/login/homePage", model: [resources: resources, resourceCount: resources.count])
//        }
//        else
//        {
//            redirect(action: "dashboard")
//        }

    }

    def dashboard() {
        if (session["username"]) {

            User currentUser = userService.showCurrentUserObject(session["username"])

            List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(session["username"])


            int offset = params.offset ? params.int('offset') : 0
            int max = params.max ? params.int('max') : 2

            //show trending topics
            List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
            int totalTopic = trendingTopics.size()

            //show Inbox
            List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["username"], max, offset)
            int total = readingItemListWithIsReadFalse.totalCount

            //show top5Subscriptions
            List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"])

            render(view: "/home/dashboard", model: [inboxCount: total, max: max, offset: offset, trendingCount: totalTopic, readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, loginUser: currentUser, trendingTopicList: trendingTopics, topicList: topics.topicName, top5SubscribedTopics: top5SubscribedTopics])
        }
    }

    def showRecentShare() {
        //show top5Subscriptions
        List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["username"])

        render(template: "/home/subscriptionOfCurrentUser", model: [top5SubscribedTopics: top5SubscribedTopics])
    }

    def paginateInbox() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 2

        //show Inbox
        List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["username"], max, offset)
        int total = readingItemListWithIsReadFalse.totalCount

        render(template: "/dashboard/iterateInbox", model: [readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, inboxCount: total, max: max, offset: offset])
    }

    def paginateTrendingTopics() {

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 2

        //show trending topics
        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
        int totalTopic = trendingTopics

        render(template: "/dashboard/trendingTopics", model: [trendingTopicList: trendingTopics, trendingCount: totalTopic, max: max, offset: offset])
    }

}
