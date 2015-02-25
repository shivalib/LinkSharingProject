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
//    Long userId

        static hasMany = [topics:Topic,subscriptions:Subscription,resources:Resource,readingItems:ReadingItem]
    //,resources:Resource,readingitems:ReadingItem,resourcerating:ResourceRating]
//
//    static mapping = {
//        id name: 'userId',generator:'auto'
//    }
        static constraints = {
            firstName blank: false,nullable: false
            lastName blank: false,nullable: false
            username blank: false,nullable: false
            password blank: false,nullable: false
            email email: true,blank: false,unique: true
            photo nullable: true
        }
}
