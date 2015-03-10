package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    def serviceMethod() {

    }

    void markReading(User user,Resource resource)
    {
        ReadingItem readingItem=new ReadingItem(isRead: true)

        //Resource resource=Resource.findWhere(createdBy: user)

        user.addToReadingItems(readingItem)
        resource.addToReadingItems(readingItem)

        readingItem.save(failOnError: true)
    }

    def generateRandomNumber()
    {
        def randomNumber=Math.abs(new Random().nextInt()%100)+1
        return randomNumber
    }
}
