package com.ig.LinkShare

class showPostController {
    def userService
    def trendingTopicService

    def index(Long id) {
        Topic topic=Topic.get(id)
        println "resource id : "+id


        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        render(view: "/user/viewPost",model: [topic:topic,trendingTopicList: trendingTopics])
    }

    def rateResource(){
        println "............... in resource rate : "
    }
}
