package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    //todo try not using def in service.
    def serviceMethod() {

    }

    void markReading(User user, Resource resource, Boolean isRead) {
        println "===========user :" + user
        println "*********resource : " + resource
        ReadingItem readingItem = new ReadingItem(isRead: isRead)

        //Resource resource=Resource.findWhere(createdBy: user)

        user.addToReadingItems(readingItem)
        resource.addToReadingItems(readingItem)
        println readingItem.errors
        readingItem.validate()
        readingItem.save(failOnError: true)
    }

    def generateRandomNumber() {
        def randomNumber = Math.abs(new Random().nextInt() % 100) + 1
        return randomNumber
    }
}
