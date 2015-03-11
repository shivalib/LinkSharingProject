package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ShowInboxService {

    def userService


    List<Resource> showInbox(String currentUser) {

        List<Resource> resourceList = Resource.createCriteria().list(offset: 0, max: 5) {
            println "------------in showInBox--------------"
            'readingItems' {
                println "in reading"
                eq('isRead', false)
            }

        }
        return resourceList
    }
}
