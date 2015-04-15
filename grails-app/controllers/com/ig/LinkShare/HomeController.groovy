package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    def top5SubscriptionService
    def trendingTopicService
    def showInboxService
    def showTopicService
    def userService
    def showResourceService
    def springSecurityService
    def topicSubscriptionService

    def index() {

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        String postUrl = "${request.contextPath}${grailsApplication.config.apf.filterProcessesUrl}"

        List<Resource> resources = showResourceService.calculateResourceList(max, offset)

        render(view: "/login/homePage", model: [postUrl:postUrl,resources: resources, resourceCount: resources.count])
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
        def currentUser=springSecurityService.currentUser

        List<Subscription> subscriptionList=topicSubscriptionService.showTop5Subscription(currentUser)

        List<Topic> trendingTopicList=trendingTopicService.showTrendingTopics()

        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: '/home/dashboard',model: [loginUser:currentUser,topicList:topics,top5SubscribedTopics:subscriptionList,trendingTopicList:trendingTopicList])
    }

    @Secured(['ROLE_ADMIN','ROLE_USER'])
    def showTopPosts() {
        List<Resource> resources1 = showResourceService.showTopPost(params.timeValue)
        render(template: "/home/topPosts", model: [resource: resources1])
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
