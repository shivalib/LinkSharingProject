package com.ig.LinkShare



class SearchController {
    def trendingTopicService
    def searchService
    def userService
    def showResourceService

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
//            println it.firstName
            it.firstName=~params.searchUserValue + "*"
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
        List<ReadingItem> readingItems=ReadingItem.findAllWhere(isRead: false)
        List<ReadingItem> readingItems1=readingItems.findAll{
            it.resource.description=~params.searchInbox
        }

        render "tadaaaaaaaaaaaaaan!"
    }


}
