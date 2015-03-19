package com.ig.LinkShare

class User {

    String firstName
    String lastName
    String username
    String password
    String photoPath
    String email
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated

    static transients = ['fullName']

    static hasMany = [topics: Topic, subscriptions: Subscription, resources: Resource, readingItems: ReadingItem, resurceRatings: ResourceRating]

    static constraints = {
        firstName blank: false, nullable: false
        lastName blank: false, nullable: false
        username blank: false, nullable: false, unique: true
        password blank: false, nullable: false
        email email: true, blank: false, unique: true
        fullName bindable: true
        photoPath nullable: true,blank: true

    }

    String getFullName() {
        return "$firstName $lastName"
    }
}
