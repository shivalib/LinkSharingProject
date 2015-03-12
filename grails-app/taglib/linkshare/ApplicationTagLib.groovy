package linkshare

import com.ig.LinkShare.LinkResource
import com.ig.LinkShare.ReadingItem
import com.ig.LinkShare.Subscription
import com.ig.LinkShare.User


class ApplicationTagLib {

    static namespace = "ls"

    static defaultEncodeAs = [taglib: 'raw']
//    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]


    def isEditable = { attr, body ->

        def currentUser = attr.currentUser
        def topicCreater = attr.topicCreater

        if (currentUser.admin | currentUser == topicCreater) {
            out << g.render(template: "/myTemplates/isAdmin")
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

    def checkResourceType={attr->

        def resource=attr.resource
        if(resource.class==LinkResource)
        {
            out<<g.render(template: "/myTemplates/isLinkResource")
        }
        else
        {
            out<<g.render(template: "/myTemplates/isDocumentResource")
        }
    }

    def isSubscribed = { attr ->
        def user = attr.currentUser

        User user1 = User.findByUsername(user.username)
        def topic = attr.topicID

        Subscription subscription = Subscription.findByUserAndTopic(user1, topic)

        if (subscription) {
            out << g.render(template: '/myTemplates/isSubscribed')
        }
    }

    def markResource={attr->
        def resource=attr.resource
        def currentUser=attr.currentUser

        List<ReadingItem> readingItemList=ReadingItem.findAllWhere(user: currentUser,resource: resource)

        readingItemList.each{ReadingItem readingItem->

            if(readingItem.isRead==true)
            {
                out<<g.render(template:'/myTemplates/isResourceRead')
            }
            else
            {
                out<<g.render(template:'/myTemplates/isResourceUnread')
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
}
