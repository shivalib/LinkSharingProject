package com.ig.LinkShare

class HomeController {

//    def top5SubscriptionService

    //def trendingTopicService

    def index() {

        List<Resource> resources=Resource.list([max:5,offset: 0,order:"desc",sort: "id"])
        println ">>>>>>>>>>>>>>>>>>>>>>>.index"
        println ">>>>>>>>>>>>>>>>>>>>>>>.Home"

        render(view: "/user/HomePage",model:[resources:resources])

    }
//
    def dashboard() {
        if(session["username"])
        {
            User currentUser=User.findByUsername(session["username"])
       //     showInbox(currentUser)

            List<Topic> topics=Topic.findAllWhere(createdBy: currentUser)

            List<Subscription> subscriptionList=Subscription.findAllByUser(currentUser)
//            subscriptionList=subscriptionList.subList(0,5)
            println(subscriptionList)

            List<Topic> trendingTopicList=Topic.list().sort{it.resources.size()}.reverse()
//            trendingTopicList=trendingTopicList.subList(0,5)

            render(view: "/user/Dashboard", model: [loginUser:currentUser,trendingTopicList:trendingTopicList,topicList:topics.topicName,subscriptionList:subscriptionList])
        }
    }

}
