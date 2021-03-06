package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class PostController {
    def springSecurityService
    def resourceService
    def resourceRatingService
    def topicService

    def index(Long id) {
        Resource resource = Resource.get(id)
        List<Topic> trendingTopics = topicService.showTrendingTopics()
        User currentUser = springSecurityService.currentUser

        Subscription subscription = Subscription.findWhere(user: currentUser)
        List<Topic> topics = topicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/post/viewPost", model: [topicList: topics, loginUser: currentUser, subscription: subscription, trendingTopicList: trendingTopics, resource: resource])
    }

    @Secured(['ROLE_ADMIN'])
    def postsForAdmin() {
        List<Resource> resourceList = resourceService.calculateResourceListForAdmin()
        User currentUser = springSecurityService.currentUser
        List<Topic> trendingTopics = topicService.showTrendingTopics()
        List<Topic> topics = topicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/post/viewPost", model: [loginUser: currentUser, topicList: topics, trendingTopicList: trendingTopics, resourceList: resourceList])
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
