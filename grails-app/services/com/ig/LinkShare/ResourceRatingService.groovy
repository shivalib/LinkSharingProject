package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ResourceRatingService {

     float findAverageRating(Resource resource){

        List<ResourceRating> resourceRatingList=ResourceRating.findAllByResource(resource)
         float averageRating
        if(resourceRatingList){

            float total=0.0
            resourceRatingList.each {
                total+=it.score
            }
            averageRating=total/resourceRatingList.size()
        }
         else
        {
            averageRating=0.0
        }
         println "..........." +averageRating

         return averageRating

    }
}
