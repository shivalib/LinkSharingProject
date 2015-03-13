package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowResourceService {

    List<Resource> showresourcesByTopic(Topic topic){

        List<Resource> resourceList=Resource.findAllByTopic(topic)
        return resourceList
    }
}
