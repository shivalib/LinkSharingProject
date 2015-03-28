package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    void markReading(User user, Resource resource, Boolean isRead) {
        ReadingItem readingItem = new ReadingItem(isRead: isRead)

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
