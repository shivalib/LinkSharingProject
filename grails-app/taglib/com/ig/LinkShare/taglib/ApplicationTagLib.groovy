package com.ig.LinkShare.taglib

import com.ig.LinkShare.DateDifferenceService
import com.ig.LinkShare.LinkResource
import com.ig.LinkShare.ReadingItem
import com.ig.LinkShare.Resource
import com.ig.LinkShare.ResourceRatingService
import com.ig.LinkShare.Subscription
import com.ig.LinkShare.Topic
import com.ig.LinkShare.User

class ApplicationTagLib {
    ResourceRatingService resourceRatingService
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

    def userPhoto={attr->
        def currentUser=attr.currentUser
        if(currentUser.photoPath){
           out<<g.render(template: "/userProfile/userPhoto",model: [loginUser: currentUser])
        }
        else
        {
            out<<g.render(template: "/userProfile/defaultUserImage",model:[loginUser: currentUser])
        }

    }

    def isEditable = { attr, body ->

        def currentUser = attr.currentUser
        def topicCreator = attr.topicCreater

        User user = User.get(currentUser.id)

        Topic topic = Topic.get(attr.topicID)

        Subscription subscription = Subscription.findWhere(topic: topic, user: user)

        if (currentUser.admin | currentUser == topicCreator) {
            out << g.render(template: "/home/isAdmin", model: [topic: topic, loginUser: attr.currentUser])
            out << g.render(template: "/myTemplates/isNotAdmin", model: [topic: topic, loginUser: attr.currentUser, subscription: subscription])
        } else {
            out << g.render(template: "/myTemplates/isNotAdmin", model: [topic: topic, loginUser: attr.currentUser, subscription: subscription])
        }
    }

    def showListingPages = { attr ->
        out << g.render(template: "/myTemplates/RecentShare", model: [res: attr.resource, diffList: attr.diffList])
    }

    def showTopPost = { attr ->
        out << g.render(template: "/home/topPosts", model: [res: attr.resource, diffList: attr.diffList])
    }

    def topicListing = { attr ->
        def loginUser = attr.loginUser
        out << g.render(template: "/myTemplates/showTopic", model: [topics: attr.topics, loginUser: loginUser])
    }

    def checkResourceType = { attr ->

        def resource = attr.resource
        if (resource.class == LinkResource) {
            LinkResource linkResource = LinkResource.findWhere(id: resource.id)
            out << g.render(template: "/myTemplates/isLinkResource", model: [linkResource: linkResource])
        } else {

            out << g.render(template: "/myTemplates/isDocumentResource", model: [resource: resource])
        }
    }

    def timeDiffInDetail = { attrs ->
        Map diff = DateDifferenceService.getDifferenceInDates(attrs.oldDate, attrs.newDate ?: new Date())
        String result = diff.years ? diff.years + " yrs " : ""
        result += diff.weeks ? diff.weeks + " weeks " : ""
        result += diff.days ? diff.days + " days " : ""
        result += diff.hours ? diff.hours + " hrs " : ""
        result += diff.minutes ? diff.minutes + " mins ago" : ""
        if (result)
            out << result
        else
            out << " 0 minutes ago"
    }

    def isSubscribed = { attr ->
        User user = attr.currentUser

        Topic topic = attr.topicID

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

        ReadingItem readingItem = ReadingItem.findByUserAndResource(currentUser, resource)
        if (!readingItem) {
            return
        }
        if (readingItem.isRead) {
            out << g.render(template: '/myTemplates/markAsUnread', model: [ajaxClass: attr.ajaxClass, currentUser: currentUser.id, currentResource: attr.resource.id])
        } else {
            out << g.render(template: '/myTemplates/markAsRead', model: [ajaxClass: attr.ajaxClass, currentUser: currentUser.id, currentResource: attr.resource.id])
        }

    }


    def isAdminOrCreatorOfResource = { attr ->
        def currentUser = attr.currentUser
        def resource = attr.resource

        if (currentUser.admin | resource.createdBy == currentUser) {
            out << g.render(template: "/showPost/isAdminOrCreator", model: [resource: resource])
        }
    }

    def checkUserForPost = { attr ->
        def user = attr.currentUser
        if (user.admin)
            out << g.render(template: "/showPost/postForAdmin")
        else
            out << g.render(template: "/showPost/postForNonAdmin")

    }

    def averageRating = { attr ->
        User currentUser = attr.currentUser
        Resource resource = attr.resource

        def averageRating = resourceRatingService.findAverageRating(resource)
        out << g.render(template: "/showPost/ratingDiv", model: [resource: resource, averageRating: averageRating])
    }


}
