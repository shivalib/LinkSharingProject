package com.ig.LinkShare

import grails.converters.JSON


class showPostController {
    def userService
    def trendingTopicService
    def showResourceService
    def resourceRatingService

    def index(Long id) {

        Resource resource = Resource.get(id)

//        Topic topic=Topic.findWhere(resources: resource)

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        User currentUser = userService.showCurrentUserObject(session["username"])

        Subscription subscription = Subscription.findWhere(user: currentUser)
        println("........"+resource)
         float averageRating=resourceRatingService.findAverageRating(resource)
//        println averageRating

        render(view: "/showPost/viewPost", model: [averageRating:averageRating,loginUser: currentUser, subscription: subscription, trendingTopicList: trendingTopics, resource: resource])
    }

    def postsForAdmin() {
        List<Resource> resourceList = showResourceService.calculateResourceListForAdmin()

        User currentUser = userService.showCurrentUserObject(session["username"])

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

//        def averageRating=resourceRatingService.findAverageRating()

        render(view: "/showPost/viewPost", model: [loginUser: currentUser, trendingTopicList: trendingTopics, resourceList: resourceList])
    }

    def rateResource() {
        println "............... in resource rate : "
        String scr = params.rating
        Float score=scr.toDouble()
        User currentUser = userService.showCurrentUserObject(session["username"])

        ResourceRating resourceRating1 = ResourceRating.findByUser(currentUser)

        if (resourceRating1) {
            resourceRating1.score = score
            resourceRating1.save(failOnError: true,flush: true)
        } else {
            ResourceRating resourceRating = new ResourceRating(user: currentUser, resource: params.resourceID, score: score)
            resourceRating.save(failOnError: true, flush: true)
        }

     render true
    }
}
