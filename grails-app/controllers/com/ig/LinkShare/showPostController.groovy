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


        def score = params.rating
        println "<<<<< resource id :" + params.resourceID
        println "<<<<< score : " + score

        User currentUser=userService.showCurrentUserObject(session["username"])
        ResourceRating resourceRating=new ResourceRating(user:currentUser,resource: params.resourceID,score: score)

        List<ResourceRating> resourceRatingList=ResourceRating.createCriteria().list {
            projections{
                avg('score')
            }
        }
         println "average : " +resourceRatingList

       if(resourceRating.save(failOnError: true,flush: true)){

           render true
       }
        else
       {
           render false
       }

    }
}
