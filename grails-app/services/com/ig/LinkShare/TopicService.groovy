package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TopicService {
    List<Topic> findTopicsSubscribedByCurrentUser(User currentUser) {

        List<Topic> topicList = Topic.createCriteria().list {
            projections {
                property('topicName')
            }
            'subscriptions' {
                eq('user', currentUser)
            }
        }
        return topicList
    }

    List<Topic> showTrendingTopics() {
        List<Topic> trendingTopics = Topic.list().sort {

            it.resources.size()
        }.reverse()

        return trendingTopics
    }

    List<Topic> findTopicsCreatedByUser(User currentUser) {

        List<Topic> topicList = Topic.createCriteria().list {
            eq('createdBy', currentUser)
        }
        return topicList
    }

    List<Topic> findTopicsNameCreatedByUser(User user)
    {
        List<Topic> topicList=Topic.createCriteria().list {
            projections {
                property('topicName')
            }
            eq('createdBy', user)
        }
    }


    List<Topic> listAllPublicTopics() {
        List<Topic> topicList = Topic.createCriteria().list {
            eq('visibility', Visibility.PUBLIC)
        }
        return topicList
    }


}
