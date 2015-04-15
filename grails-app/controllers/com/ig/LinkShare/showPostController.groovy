package com.ig.LinkShare

class showPostController {
    def springSecurityService
    def trendingTopicService
    def showResourceService
    def resourceRatingService
    def showTopicService

    def index(Long id) {
        Resource resource = Resource.get(id)
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
        User currentUser = springSecurityService.currentUser

        Subscription subscription = Subscription.findWhere(user: currentUser)
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/showPost/viewPost", model: [topicList: topics, loginUser: currentUser, subscription: subscription, trendingTopicList: trendingTopics, resource: resource])
    }

    def postsForAdmin() {
        List<Resource> resourceList = showResourceService.calculateResourceListForAdmin()
        User currentUser =springSecurityService.currentUser
        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/showPost/viewPost", model: [loginUser: currentUser, topicList: topics, trendingTopicList: trendingTopics, resourceList: resourceList])
    }

    def rateResource() {
        String scr = params.rating
        Float score = scr.toDouble()
        User currentUser = springSecurityService.currentUser
        Resource resource=Resource.get(params.resourceID)

        ResourceRating resourceRating1 = ResourceRating.findByUserAndResource(currentUser,resource)

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
