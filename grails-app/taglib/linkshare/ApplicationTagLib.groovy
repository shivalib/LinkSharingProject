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
        def topicID = attr.topicID

        Topic topic = Topic.findById(attr.topicID)

        if (currentUser.admin | currentUser == topicCreater) {
            out << g.render(template: "/home/isAdmin", model: [topicID: topic])
            out << g.render(template: "/myTemplates/isNotAdmin", model: [topicID: topic])
        } else {
            out << g.render(template: "/myTemplates/isNotAdmin")
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
        def user = attr.currentUser

        User user1 = User.findByUsername(user.username)
        def topic = attr.topicID

        Subscription subscription = Subscription.findByUserAndTopic(user1, topic)
        if (subscription) {
            out << g.render(template: '/home/isSubscribed')

        }
        if (user1.admin | user1 == topic.createdBy) {
            out << g.render(template: "/home/isAdmin", model: [topicID: topic])
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

    def isNotSubscribed = { attr ->
        def user = attr.currentUser
        User user1 = User.findByUsername(user.username)
        def topic = attr.topicID

        Subscription subscription = Subscription.findByUserAndTopic(user1, topic)

        if (!subscription) {
            out << g.render(template: '/myTemplates/isNotSubscribed', model: [topicName: attr.topicName])
        }
    }

    def checkUser={

//        if(session["username"]){
//            g.render("need to be replaced by trending topic")
//        }
//        else
//        {
         out<<   g.render(template: '/home/notLogin')
//        }
    }
}
