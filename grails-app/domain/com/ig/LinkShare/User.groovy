package com.ig.LinkShare

class User {

        String firstName
        String lastName
        String username
        String password
        String email
        Byte photo
        Boolean admin
        Boolean active

        static transients = ['fullName']

        static hasMany = [topics:Topic,subscriptions:Subscription,resources:Resource,readingItems:ReadingItem,resurceRatings:ResourceRating]

        static constraints = {
            firstName blank: false,nullable: false
            lastName blank: false,nullable: false
            username blank: false,nullable: false,unique: true
            password blank: false,nullable: false
            email email: true,blank: false,unique: true
            photo nullable: true
            fullName bindable:true

        }

        String getFullName(){
        return "$firstName $lastName"
    }
}
