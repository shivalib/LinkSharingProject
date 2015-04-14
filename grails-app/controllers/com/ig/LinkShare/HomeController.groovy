package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    def top5SubscriptionService
    def trendingTopicService
    def showInboxService
    def showTopicService
    def userService
    def showResourceService

    def index() {

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Resource> resources = showResourceService.calculateResourceList(max, offset)

        render(view: "/login/homePage", model: [resources: resources, resourceCount: resources.count])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def activateRegisteredUser(Long id) {
        UserToken userToken = UserToken.get(id)
        if(!userToken.used)
        {
            userToken.user.active = true
            userToken.used=true
        }
        userToken.save(failOnError: true, flush: true)
        redirect(controller: "home", action: "index")
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def dashboard() {
            User currentUser = User.findById(session["userID"])

            List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

            int offset = params.offset ? params.int('offset') : 0
            int max = params.max ? params.int('max') : 5

            //show trending topics
            List<Topic> trendingTopics = trendingTopicService.showTrendingTopics(max, offset)
            int totalTopic = trendingTopics.size()

            //show Inbox
            List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["userID"], max, offset)
            int total = readingItemListWithIsReadFalse.totalCount

            //show top5Subscriptions
            List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["userID"], max, offset)
            int subscriptionCount = top5SubscribedTopics.totalCount

            render(view: "/home/dashboard", model: [subscriptionCount: subscriptionCount, inboxCount: total, max: max, offset: offset, trendingCount: totalTopic, readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, loginUser: currentUser, trendingTopicList: trendingTopics, topicList: topics.topicName, top5SubscribedTopics: top5SubscribedTopics])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def showTopPosts() {
        List<Resource> resources1 = showResourceService.showTopPost(params.timeValue)
        render(template: "/home/topPosts", model: [resource: resources1])
    }

    def paginateUserSubscription() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Topic> top5SubscribedTopics = top5SubscriptionService.showTop5Subscription(session["userID"], max, offset)
        int subscriptionCount = top5SubscribedTopics.totalCount

        render(template: "/home/subscriptionOfCurrentUser", model: [top5SubscribedTopics: top5SubscribedTopics, subscriptionCount: subscriptionCount, max: max, offset: offset])
    }

    def paginateRecentShare() {

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5
        List<Resource> resources = showResourceService.calculateResourceList(max, offset)
        render(template: "/home/subscriptionOfCurrentUser", model: [resources: resources])
    }

    def paginateInbox() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["userID"], max, offset)
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
