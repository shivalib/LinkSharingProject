package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowTopicService {

    List<Topic> findTopicsOfCurrentUser(String loginUser){

        User currentUser=User.findByUsername(loginUser)

        List<Topic> topicList=Topic.findAllWhere(createdBy: currentUser)

        return topicList
    }
}
