package com.ig.LinkShare

class showPostController {
    def userService
    def trendingTopicService
    def showResourceService

    def index(Long id) {

        Topic topic=Topic.get(id)
        println "resource id : "+id

        List<Resource> resourceList=showResourceService.showResourcesByTopic(topic)
        resourceList.each {println "----------" +it}

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        User currentUser=userService.showCurrentUserObject(session["username"])

        render(view: "/showPost/viewPost",model: [loginUser:currentUser,topic:topic,trendingTopicList: trendingTopics,resourceList:resourceList])
    }

    def rateResource(){
        println "............... in resource rate : "
        println "<<<<< resource id :" +params.resourceID
        println "<<<<< score : "+params.rating

        render "in rating"

    }
}
