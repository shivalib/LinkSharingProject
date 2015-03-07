package com.ig.LinkShare

import LinkShareEnums.Visibility

class Topic {
    String topicName
    Visibility visibility
    Date dateCreated
    Date lastUpdated


    static hasMany = [resources:Resource,subscriptions:Subscription]
//    static hasMany = [resources:Resource]

    static belongsTo = [createdBy:User]

    static constraints = {
        topicName nullable: false,blank: false,unique: "createdBy"
    }

}
