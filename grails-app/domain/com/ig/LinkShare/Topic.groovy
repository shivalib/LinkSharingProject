package com.ig.LinkShare

class Topic {
    String topicName
    Date dateCreated
    Date lastUpdated


//    static hasMany = [resources:Resource,subscriptions:Subscription]
    static hasMany = [resources:Resource]

    static belongsTo = [createdBy:User]

    static constraints = {
        topicName nullable: false,blank: false
    }

}
