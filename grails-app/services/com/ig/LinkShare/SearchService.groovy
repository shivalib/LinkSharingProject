package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class SearchService {
    UserService userService

    def userSubscriptions(User currentUser, def max, def offset) {

        List<Subscription> subscriptions = Subscription.createCriteria().list(max: max, offset: offset) {

            eq('user', currentUser)
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }

        }
        return subscriptions
    }

    List<ReadingItem> searchInbox(User user,String searchInbox) {

        List<ReadingItem> readingItems1 = ReadingItem.createCriteria().list {
            eq('isRead', false)
            eq('user', user)
            'resource'
                    {
                        ilike('description',searchInbox + '%')
                    }
        }
        return readingItems1
    }

    def searchAll(String textToSearch){

        List<Resource> resources = Resource.createCriteria().list {

            ilike('description', textToSearch + '%')

        }
        List topic = Topic.createCriteria().list {
            ilike('topicName', textToSearch + '%')
        }
        List newList = []
        topic.each {
            newList += it.resources
        }
        resources += newList

    }


}
