package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ResourceRatingService {

     float findAverageRating(Resource resource){

        List<ResourceRating> resourceRatingList=ResourceRating.findAllByResource(resource)

         float total=0.0
         resourceRatingList.each {
             total+=it.score
         }
         float averageRating=total/resourceRatingList.size()
         return averageRating

    }
}
