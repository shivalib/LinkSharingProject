package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    def serviceMethod() {

    }

    void markReading(User user,Resource resource,Boolean isRead)
    {
        ReadingItem readingItem=new ReadingItem(isRead: isRead)

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
