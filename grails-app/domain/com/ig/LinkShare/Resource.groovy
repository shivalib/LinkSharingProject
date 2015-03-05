package com.ig.LinkShare

class Resource {
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic,createdBy:User]

    static hasMany = [readingItems:ReadingItem,resouceRatings:Resource]

    static constraints = {
        description maxSize: 1024
    }

    static mapping = {
        tablePerHierarchy(false)
    }

}
