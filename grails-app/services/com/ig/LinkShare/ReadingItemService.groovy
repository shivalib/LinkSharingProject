package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class ReadingItemService {

    def serviceMethod() {

    }

    //mark item as read
    void markReadingItems()
    {
        //mark all readingitem as false
        List<User> listUser=User.findAll()
        println listUser

//        listUser.each { User user->
//            println user
//
//            // randomly mark 3 readingitem as true
//            (1..3).each{ Integer counter->
//                println user
//                ReadingItem readingItem=new ReadingItem(isRead: true)
//                def randomNum=generateRandomNumber()
//                println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
//                println "Random no generated is "+randomNum
//                Resource resource=Resource.findById(randomNum)
//                println "the resource is >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+resource
//                resource.addToReadingItems(readingItem)
//                user.addToReadingItems(readingItem)
//                readingItem.save(failOnError: true)
//
//            }
//        }



        listUser.each {User user1->
            println user1

            List<Resource> resourceList=Resource.findAllWhere(createdBy:user1 )

            resourceList.each {Resource resource->

                ReadingItem readingItem = new ReadingItem(isRead: true)

                resource.addToReadingItems(readingItem)

                user1.addToReadingItems(readingItem)

                readingItem.save(failOnError: true)
            }
        }
    }

    void markReading(User user)
    {
        ReadingItem readingItem=new ReadingItem(isRead: true)
        Resource resource=Resource.findWhere(createdBy: user)
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
