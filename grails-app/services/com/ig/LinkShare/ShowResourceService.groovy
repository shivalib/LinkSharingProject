package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class ShowResourceService {

    List<Resource> showResourcesByTopic(Topic topic) {

        List<Resource> resourceList = Resource.findAllByTopic(topic)
        return resourceList
    }


    List<Resource> calculateResourceList(){
        List<Resource> resources = Resource.createCriteria().list{
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        return resources
    }

    List<Resource> calculateResourceListForAdmin(){
        List<Resource> resources = Resource.createCriteria().list{

        }
        return resources
    }

    List<Resource> showTopPost(){
        List<ResourceRating> resourceRatingList=ResourceRating.createCriteria().list{
                        order("score","desc")
        }
        return resourceRatingList
    }


}
