package com.ig.LinkShare

//import spock.util.mop.Use

class HomeController {

    def index() {

        List<Resource> resources=Resource.list([max:5,offset: 0,order:"desc",sort: "id"])

//        if (session["username"]) {
//            println session["username"]
//            String currentUserName = session["username"]
//            println currentUserName
//            User currentUser = User.findByUsername((String)session["username"])
//            println "aa"+currentUser.firstName
//            render(view: "/user/Dashboard", model: [myUser: currentUser])
//        }

        render(view: "/user/HomePage",model:[resources:resources])

    }

    def dashboard() {
        if(session["username"])
        {
            User currentUser=User.findByUsername(session["username"])
       //     showInbox(currentUser)
            render(view: "/user/Dashboard", model: [loginUser:currentUser])
        }
    }

//    def showInbox(User currentUser)
//    {
//        println "in showInbox"
//        List<ReadingItem> readingItems=ReadingItem.findAll()
////        println readingItems
//
//        List<ReadingItem> readingItems1=ReadingItem.findAllWhere(isRead: true)
//        println readingItems1
////        println "Number: " +resources
//    }



}
