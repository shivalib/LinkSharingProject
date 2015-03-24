package com.ig.LinkShare



class showPostController {
    def userService
    def trendingTopicService
    def showResourceService

    def index(Long id) {

        Resource resource= Resource.get(id)

//        Topic topic=Topic.findWhere(resources: resource)

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        User currentUser = userService.showCurrentUserObject(session["username"])

        Subscription subscription = Subscription.findWhere(user: currentUser)

        render(view: "/showPost/viewPost", model: [loginUser: currentUser,subscription:subscription,trendingTopicList: trendingTopics,resource:resource])
    }

    def postsForAdmin(){
        List<Resource> resourceList=showResourceService.calculateResourceListForAdmin()

        User currentUser = userService.showCurrentUserObject(session["username"])

        List<Topic> trendingTopics = trendingTopicService.showTrendingTopics()

        render(view: "/showPost/viewPost", model: [loginUser: currentUser,trendingTopicList: trendingTopics, resourceList: resourceList])
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
