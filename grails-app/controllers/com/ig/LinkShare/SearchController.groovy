package com.ig.LinkShare



class SearchController {
    def trendingTopicService
    def searchService
    def userService
    def showResourceService
    def showInboxService

    def index() {
        User loginUser = User.findByUsername(session["username"])

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        render(view: "searchTopic", model: [loginUser: loginUser, trendingTopicList: trendingTopics])
    }

    def searchTopic() {

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

    def searchUser(){

        println "...user : ...........${params.searchUserValue}"

        List<User> userList1=User.list()
        List<User> userList=userList1.findAll{
            (it.firstName=~params.searchUserValue + "*") || (it.lastName=~params.searchUserValue + "*") || (it.username=~params.searchUserValue + "*")
        }

        render(template: "/userListing/userEntry",model: [userList:userList])
    }

    def searchPost(){
        User currentUser = userService.showCurrentUserObject(session["username"])
        println "........... in search post .........."
        println "id :" + params.topicID

        Topic topic=Topic.findById(params.topicID)
        println topic.topicName

        List<Resource> resourceList=showResourceService.showResourcesByTopic(topic)
        resourceList.each {
            println "in searchPost : " +it.topic.topicName
            println "desc : " +it.description
        }

        render(template: 'postOnTopicName',model:[resourceList:resourceList,loginUser: currentUser] )
    }

    def searchInbox(){
        println "------------ in search inbox -----------"
        println "^^^^^^^^^ ${params.searchInbox}"

        List<ReadingItem> readingItemListWithIsReadFalse = showInboxService.showInbox(session["username"])

        List<ReadingItem> readingItems1=readingItemListWithIsReadFalse.findAll{
            (it.resource.description=~params.searchInbox) || (it.resource.topic.createdBy.fullName=~params.searchInbox)
        }

        render(template: "/dashboard/iterateInbox",model: [readingItemListWithIsReadFalse:readingItems1])
    }


}
