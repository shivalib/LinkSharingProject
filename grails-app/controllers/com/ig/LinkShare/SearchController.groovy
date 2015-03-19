package com.ig.LinkShare



class SearchController {
    def trendingTopicService
    def searchService
    def userService

    def index() {
        User loginUser = User.findByUsername(session["username"])

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        render(view: "searchTopic", model: [loginUser: loginUser, trendingTopicList: trendingTopics])
    }

    def searchTopic() {
        println "-----------------------in search topic : "


        User currentUser = userService.showCurrentUserObject(session["username"])

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Subscription> subscriptions=searchService.userSubscriptions(currentUser,max,offset)

        int total = subscriptions.totalCount

        List<Subscription> subscriptions1=subscriptions.findAll{
            it.topic.topicName=~params.searchText + "*"
        }

        render(template:"/subscription/allSubscription", model: [loginUser: currentUser, subscriptions: subscriptions1, max: max, offset: offset, subscriptionCount: total])


    }


}
