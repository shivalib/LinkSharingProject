package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class ShowResourceService {

    List<Resource> showresourcesByTopic(Topic topic) {

        List<Resource> resourceList = Resource.findAllByTopic(topic)
        return resourceList
    }

    List<Resource> calculateResourceList(){
        List<Resource> resources = Resource.createCriteria().list(max:5,offset:0,sort:'id',order:'desc') {
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        return resources
    }

}
