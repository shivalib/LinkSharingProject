import LinkShareEnums.Seriousness
import com.ig.LinkShare.DocumentResource
import com.ig.LinkShare.LinkResource
import com.ig.LinkShare.ReadingItem
import com.ig.LinkShare.Resource
import com.ig.LinkShare.Topic
import com.ig.LinkShare.User
import com.ig.LinkShare.Subscription
//import sun.plugin.javascript.navig.Link

class BootStrap {

    def init = { servletContext ->
        createUser()
        createReadingItems()
    }

    def destroy = {
    }

    //create 2 user
    void createUser() {
        (1..2).each {
            User user = new User(firstName: "User ${it}", lastName: "userLast ${it}", username: "intelligrape${it}", password: "igdefault${it}", email: "shivalib${it}@intelligrape.com", photo: 0, admin: false, active: false)
            if(user.save(failOnError: true))
            {
                5.times {
                    Topic topic=createTopic(user,it)
                }
            }
            else
            {
                user.errors.allErrors.each {println it}
            }
        }
    }

    //create 5 topic for each user
    Topic createTopic(User user,Integer it)
    {
        Topic topic = new Topic(topicName: "Topic ${it}", createdBy: user)
        if (topic.save(flush: true, failOnError: true)) {

            user.addToTopics(topic)
            Subscription subscribe=subscribeTopic(user, topic)

            5.times {
                createResources(user,topic,it)
            }
        } else {
            topic.errors.allErrors.each {println it}
        }
        return topic
    }

    //subscribe topic
    Subscription subscribeTopic(User user, Topic topic) {
        Subscription subscription = new Subscription(seriousness:Seriousness.VERYSERIOUS, user: user, topic: topic)
        if (subscription.save(flush: true, failOnError: true)) {
            user.addToSubscriptions(subscription)
        }
        else {
            subscription.errors.allErrors.each {println it}
        }
        return subscription
    }

    void createResources(User user,Topic topic,Integer it)
    {

        DocumentResource documentResource=createDocumentResource(user,topic,it)
        LinkResource linkResource=createLinkResource(user,topic,it)


    }
    //document resource
    DocumentResource createDocumentResource(User user,Topic topic,Integer it)
    {
        DocumentResource documentResource = new DocumentResource(createdBy: user, description: "myResource", fileName: "myfile${it}",filePath: "/home/intelligrape/Documents/LinksharingRequirement.docx", topic: topic)
        topic.addToResources(documentResource)
        documentResource.save(flush: true,failOnError: true)
        return documentResource
    }

    //link resource
    LinkResource createLinkResource(User user,Topic topic,Integer it)
    {
        LinkResource linkResource = new LinkResource(createdBy: user, description: "myResource", linkUrl: "http://www.google.com", topic: topic)
        topic.addToResources(linkResource)
        linkResource.save(flush: true,failOnError: true)
        return linkResource
    }

    //mark item as read
    void createReadingItems()
    {
        List<User> listUser=User.findAll()
        println listUser
        listUser.each { User user->
            println user
            (1..3).each{ Integer counter->
                println user
                ReadingItem readingItem=new ReadingItem(isRead: true)
                def randomNum=generateRandomNumber()
                println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
                println "Random no generated is "+randomNum
                Resource resource=Resource.findById(randomNum)
                println "the resource is >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+resource
                resource.addToReadingItems(readingItem)
                user.addToReadingItems(readingItem)
                readingItem.save(failOnError: true)

            }
        }
    }

    def generateRandomNumber()
    {
        def randomNumber=Math.abs(new Random().nextInt()%100)+1
        return randomNumber
    }

}