package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class HomeController {

    def showInboxService
    def showTopicService
    def showResourceService
    def springSecurityService
    def topicSubscriptionService

    def index() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Resource> resources = showResourceService.calculateResourceList(max, offset)

        render(view: "/login/homePage", model: [resources: resources, postUrl: params.postUrl, rememberMeParameter: grailsApplication.config.rememberMe.parameter, resourceCount: resources.count])
    }

    def activateRegisteredUser(Long id) {
        UserToken userToken = UserToken.get(id)
        if (!userToken.used) {
            userToken.user.active = true
            userToken.used = true
        }
        userToken.save(failOnError: true, flush: true)
        redirect(controller: "login", action: "auth")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def dashboard() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        def currentUser = springSecurityService.currentUser
        List<Subscription> subscriptionList = topicSubscriptionService.showTop5Subscription(currentUser)
        List<Topic> trendingTopicList = showTopicService.showTrendingTopics()
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)
        List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(currentUser, max, offset)
        def totalInboxItems = readingItemListWithIsReadFalse.totalCount

        render(view: '/home/dashboard', model: [loginUser: currentUser, readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, topicList: topics, max: max, offset: offset, totalInboxItems: totalInboxItems, top5SubscribedTopics: subscriptionList, trendingTopicList: trendingTopicList])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def paginateInbox() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        def currentUser = springSecurityService.currentUser
        List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(currentUser, max, offset)
        def totalInboxItems = readingItemListWithIsReadFalse.totalCount

        render(template: '/dashboard/iterateInbox', model: [loginUser: currentUser, readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, totalInboxItems: totalInboxItems, max: max, offset: offset])
    }

    def showTopPosts() {
        List<Resource> resources1 = showResourceService.showTopPost(params.timeValue)
        render(template: "/home/topPosts", model: [resource: resources1])
    }
}
