package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class showPostController {
    def springSecurityService
    def trendingTopicService
    def showResourceService
    def resourceRatingService
    def showTopicService

    def index(Long id) {
        Resource resource = Resource.get(id)
        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
        User currentUser = springSecurityService.currentUser

        Subscription subscription = Subscription.findWhere(user: currentUser)
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/showPost/viewPost", model: [topicList: topics, loginUser: currentUser, subscription: subscription, trendingTopicList: trendingTopics, resource: resource])
    }

//    @Secured(['ROLE_ADMIN'])
    def postsForAdmin() {
        List<Resource> resourceList = showResourceService.calculateResourceListForAdmin()
        User currentUser = springSecurityService.currentUser
        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/showPost/viewPost", model: [loginUser: currentUser, topicList: topics, trendingTopicList: trendingTopics, resourceList: resourceList])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def rateResource() {
        String scr = params.rating
        Float score = scr.toDouble()
        User currentUser = springSecurityService.currentUser
        Resource resource = Resource.get(params.resourceID)
        ResourceRating resourceRating1 = ResourceRating.findByUserAndResource(currentUser, resource)

        if (resourceRating1) {
            resourceRating1.score = score
            resourceRating1.save(failOnError: true, flush: true)
        } else {
            ResourceRating resourceRating = new ResourceRating(user: currentUser, resource: params.resourceID, score: score)
            resourceRating.save(failOnError: true, flush: true)
        }
        render true
    }
}
