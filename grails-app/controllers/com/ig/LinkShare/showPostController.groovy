package com.ig.LinkShare

class showPostController {
    def userService
    def trendingTopicService
    def showResourceService

    def index(Long id) {

        Topic topic = Topic.get(id)
        println "resource id : " + id

        List<Resource> resourceList = showResourceService.showResourcesByTopic(topic)
        resourceList.each { println "----------" + it }

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        User currentUser = userService.showCurrentUserObject(session["username"])

        render(view: "/showPost/viewPost", model: [loginUser: currentUser, topic: topic, trendingTopicList: trendingTopics, resourceList: resourceList])
    }

    def rateResource() {
        println "............... in resource rate : "

//        int score = params.int(params.rating)
        def score = params.rating
        println "<<<<< resource id :" + params.resourceID
        println "<<<<< score : " + score

//        if (score > 0.5 | score > 1.5 | score > 2.5 | score > 3.5 | score > 4.5) {
//            score = Math.round(score)
//        }
//        println "rounded off : " + Math.ceil(score)

        render "in rating"

    }
}
