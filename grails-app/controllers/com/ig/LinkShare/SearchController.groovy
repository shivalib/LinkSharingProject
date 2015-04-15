package com.ig.LinkShare


class SearchController {
    def trendingTopicService
    def searchService
    def showResourceService
    def showInboxService
    def showTopicService
    def topicSubscriptionService
    def springSecurityService

    def searchPage() {

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        User currentUser = springSecurityService.currentUser

        List<Resource> resources = searchService.searchAll(params.searchGlobal)

        render(view: "searchResult", model: [loginUser: currentUser, resourceList: resources, searchValue: params.searchGlobal, trendingTopicList: trendingTopics])
    }

    def searchTopic() {

        User currentUser = springSecurityService.currentUser

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Subscription> subscriptions = topicSubscriptionService.userSubscriptions(currentUser, max, offset)

        int total = subscriptions.totalCount

        List<Subscription> subscriptions1 = subscriptions.findAll {
            it.topic.topicName =~ params.searchText + "*"
        }

        render(template: "/subscription/allSubscription", model: [loginUser: currentUser, subscriptions: subscriptions1, max: max, offset: offset, subscriptionCount: total])
    }

    def searchUser() {

        List<User> userList1 = User.list()
        List<User> userList = userList1.findAll {
            (it.firstName =~ params.searchUserValue + "*") || (it.lastName =~ params.searchUserValue + "*") || (it.username =~ params.searchUserValue + "*")
        }

        render(template: "/userListing/userEntry", model: [userList: userList])
    }

    def displayPostOnTopicNameClick() {
        User currentUser=springSecurityService.currentUser
        Topic topic = Topic.findById(params.topicID)

        List<Resource> resourceList = showResourceService.showResourcesByTopic(topic)

        render(template: 'postOnTopicName', model: [resourceList: resourceList, loginUser: currentUser])
    }

    def searchInbox() {
        User user = springSecurityService.currentUser

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<ReadingItem> readingItems = searchService.searchInbox(user, params.searchInbox)

        int total = readingItems.size()

        render(template: "/dashboard/iterateInbox", model: [readingItemListWithIsReadFalse: readingItems, inboxCount: total, max: max, offset: offset])
    }

}
