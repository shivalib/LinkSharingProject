package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility

class HomeController {

    def top5SubscriptionService

    def trendingTopicService
    def showInboxService
    def showTopicService
    def userService

    def index() {

        params.max = params.max ?: 5
        params.offset = params.offset ?: 0
        params.sort = params.sort ?: 'id'
        params.order = params.order ?: 'desc'

        List<Resource> resources = Resource.createCriteria().list(params) {
            'topic'{
                eq('visibility',Visibility.PUBLIC)
            }
        }

        println ">>>>>>>>>>>>>>>>>>>>>>>.index"
        println ">>>>>>>>>>>>>>>>>>>>>>>.Home"

//        resources.each {println it}

        render(view: "/login/homePage", model: [resources: resources,resourceCount:resources.count])
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
