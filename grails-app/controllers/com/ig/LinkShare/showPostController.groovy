package com.ig.LinkShare

class showPostController {
    def userService
    def trendingTopicService
    def showResourceService
    def resourceRatingService
    def showTopicService

    def index(Long id) {

        Resource resource = Resource.get(id)

//        Topic topic=Topic.findWhere(resources: resource)

        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics(max, offset)

        User currentUser = userService.showCurrentUserObject(session["username"])

        Subscription subscription = Subscription.findWhere(user: currentUser)

        //for menu
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/showPost/viewPost", model: [topicList: topics, loginUser: currentUser, subscription: subscription, trendingTopicList: trendingTopics, resource: resource])
    }

    def postsForAdmin() {
        int offset = params.offset ? params.int('offset') : 0
        int max = params.max ? params.int('max') : 5

        List<Resource> resourceList = showResourceService.calculateResourceListForAdmin()

        User currentUser = userService.showCurrentUserObject(session["username"])

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics(max, offset)

        //for menu
        List<Topic> topics = showTopicService.findTopicsSubscribedByCurrentUser(currentUser)

        render(view: "/showPost/viewPost", model: [loginUser: currentUser, topicList: topics.topicName, trendingTopicList: trendingTopics, resourceList: resourceList])
    }

    def rateResource() {
        String scr = params.rating
        Float score = scr.toDouble()
        User currentUser = userService.showCurrentUserObject(session["username"])
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
