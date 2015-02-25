package com.ig.LinkShare

class Resource {
    String description
    User createdBy
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic:Topic]

    static hasMany = [readngItems:ReadingItem]

    static constraints = {
        description maxSize: 1024
    }

}
