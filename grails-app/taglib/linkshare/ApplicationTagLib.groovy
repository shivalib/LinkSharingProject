package linkshare

import com.ig.LinkShare.LinkResource
import com.ig.LinkShare.ReadingItem
import com.ig.LinkShare.Subscription
import com.ig.LinkShare.Topic
import com.ig.LinkShare.User


class ApplicationTagLib {

    static namespace = "ls"

    static defaultEncodeAs = [taglib: 'raw']

    def showHeader = { attr ->
        def loginUser = attr.currentUser
        if (loginUser) {
            if (loginUser.admin) {
                out << g.render(template: "/dashboard/headerForAdmin")
            } else {
                out << g.render(template: "/dashboard/headerForUser")
            }
        }
    }


    def isEditable = { attr, body ->

        def currentUser = attr.currentUser
        def topicCreater = attr.topicCreater

        User user = User.get(currentUser.id)

        Topic topic = Topic.get(attr.topicID)

        Subscription subscription = Subscription.findWhere(topic: topic, user: user)

        if (currentUser.admin | currentUser == topicCreater) {
            out << g.render(template: "/home/isAdmin", model: [topic: topic, loginUser: attr.currentUser])
            out << g.render(template: "/myTemplates/isNotAdmin", model: [topic: topic, loginUser: attr.currentUser, subscription: subscription.seriousness])
        } else {
            out << g.render(template: "/myTemplates/isNotAdmin", model: [topic: topic, loginUser: attr.currentUser, subscription: subscription.seriousness])
        }
    }

    def showListingPages = { attr ->
        out << g.render(template: "/myTemplates/RecentShare", model: [res: attr.resource])
    }

    def topicListing = { attr ->
        def loginUser = attr.loginUser
        out << g.render(template: "/myTemplates/showTopic", model: [topics: attr.topics, loginUser: loginUser])
    }

    def checkResourceType = { attr ->

        def resource = attr.resource
        if (resource.class == LinkResource) {
            out << g.render(template: "/myTemplates/isLinkResource")
        } else {
            out << g.render(template: "/myTemplates/isDocumentResource")
        }
    }

    def isSubscribed = { attr ->
        User user = attr.currentUser

        Topic topic = attr.topicID

        println "--------- currentUser : " + user.username
        println "--------- topic :" + topic.topicName

        Subscription subscription = Subscription.findWhere(user: user, topic: topic)

        if (subscription) {

            out << g.render(template: '/home/isSubscribed', model: [topic: topic, subscription: subscription])

        }
        if (user.admin || user == topic.createdBy) {
            out << g.render(template: "/home/isAdmin", model: [topic: topic])
        }
    }


    def isNotSubscribed = { attr ->
        def user = attr.currentUser
        User user1 = User.findByUsername(user.username)
        def topic = attr.topicID

        Subscription subscription = Subscription.findByUserAndTopic(user1, topic)

        if (!subscription) {
            out << g.render(template: '/myTemplates/isNotSubscribed', model: [topic: topic])
        }
    }

    def markResource = { attr ->

        def resource = attr.resource
        def currentUser = attr.currentUser

        List<ReadingItem> readingItemList = ReadingItem.findAllByUserAndResource(currentUser, resource)

        readingItemList.each { ReadingItem readingItem ->
            if (readingItem.isRead) {
                out << g.render(template: '/myTemplates/markAsUnread', model: [currentUser: currentUser.id, currentResource: attr.resource.id])
            } else {
                out << g.render(template: '/myTemplates/markAsRead', model: [currentUser: currentUser.id, currentResource: attr.resource.id])
            }
        }
    }
//
    def isAdminOrCreatorOfResource = { attr ->
        def currentUser = attr.currentUser
        def resource = attr.resource

        if (currentUser.admin | resource.createdBy == currentUser) {
            out << g.render(template: "/showPost/isAdminOrCreator", model: [resource: resource])
        }
    }

    def activateOrDeactivate={attr->
//        out<<attr.checkUser
        User user=User.get(attr.checkUser)
        if(user.active){
            out<<g.render(template: "/showPost/isActive",model: [user:user])
        }
        else {
            out<<g.render(template: "/showPost/isDeactive",model: [user:user])
        }
    }
}
