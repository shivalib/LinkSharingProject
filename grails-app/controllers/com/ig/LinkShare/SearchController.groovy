package com.ig.LinkShare


class SearchController {
    def trendingTopicService
    def searchService
    def userService
    def showResourceService
    def showInboxService
    def showTopicService

    def index() {
        User loginUser = userService.showCurrentUserObject(session["username"])
        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
        render(view: "searchTopic", model: [loginUser: loginUser, trendingTopicList: trendingTopics])
    }

    def searchTopic() {

        User currentUser = userService.showCurrentUserObject(session["username"])

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Subscription> subscriptions = searchService.userSubscriptions(currentUser, max, offset)

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
        User currentUser = userService.showCurrentUserObject(session["username"])

        Topic topic = Topic.findById(params.topicID)

        List<Resource> resourceList = showResourceService.showResourcesByTopic(topic)

        render(template: 'postOnTopicName', model: [resourceList: resourceList, loginUser: currentUser])
    }

    def searchInbox() {
        User user = userService.showCurrentUserObject(session["username"])

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<ReadingItem> readingItems = searchService.searchInbox(user, params.searchInbox)

        int total = readingItems.size()

        render(template: "/dashboard/iterateInbox", model: [readingItemListWithIsReadFalse: readingItems, inboxCount: total, max: max, offset: offset])
    }

    def searchAll() {

        User currentUser = userService.showCurrentUserObject(session["username"])
        
        List<Resource> resources = searchService.searchAll(params.textToSearch)

        render(template: "searchResult", model: [resourceList: resources, loginUser: currentUser])
    }


}
