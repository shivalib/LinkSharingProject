package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class ShowTopicService {

    List<Topic> findTopicsSubscribedByCurrentUser(String loginUser) {

        User currentUser = User.findByUsername(loginUser)

        List<Topic> topicList = Topic.createCriteria().list {

            'subscriptions' {
                eq('user', currentUser)
            }
        }
        return topicList
    }

    List<Topic> findTopicsCreatedByCurrentUser(String loginUser) {

        User currentUser = User.findByUsername(loginUser)

        List<Topic> topicList = Topic.createCriteria().list {
            eq('createdBy',currentUser)
        }
        return topicList
    }


    List<Topic> listAllPublicTopics(){
        List<Topic> topicList=Topic.createCriteria().list {
            eq('visibility',Visibility.PUBLIC)
        }
        return topicList
    }


}
