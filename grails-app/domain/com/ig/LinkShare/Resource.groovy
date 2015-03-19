package com.ig.LinkShare

//todo note the difference between a plain class and abstract class - for domains
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
