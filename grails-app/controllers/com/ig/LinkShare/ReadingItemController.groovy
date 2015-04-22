package com.ig.LinkShare

class ReadingItemController {

    def markAsReadOrUnread() {
        User currentUser = User.findById(params.currentUser)
        Resource resource = Resource.findById(params.currentResource)
        ReadingItem readingItem = reverseReadingItem(currentUser, resource)
        readingItem.save(failOnError: true, flush: true)
        render(template: "/post/topicPost", model: [resourceList: readingItem.resource, loginUser: currentUser])
    }

    def markAsReadOrUnreadForTopicClick() {

        User currentUser = User.findById(params.currentUser)
        Resource resource = Resource.findById(params.currentResource)
        ReadingItem readingItem = reverseReadingItem(currentUser, resource)
        readingItem.save(failOnError: true, flush: true)
        render(template: "/subscription/markReadOrUnreadOnTopicClick", model: [resources: readingItem.resource, loginUser: currentUser])
    }

    def reverseReadingItem(User currentUser, Resource resource) {
        ReadingItem readingItem = ReadingItem.findByUserAndResource(currentUser, resource)
        readingItem.isRead = !readingItem.isRead
        return readingItem
    }
}
