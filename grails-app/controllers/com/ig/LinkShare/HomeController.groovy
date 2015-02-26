package com.ig.LinkShare

class HomeController {

    def index() {

        List<Resource> resources=Resource.list([max:5,offset: 0,order:"desc",sort: "id"])

        render(view: "/user/HomePage",model:[resources:resources])

    }

    def dashboard(String username)
    {
        render(view: "/user/Dashboard",params:[username:username])

    }

    def createInbox()
    {
        List<ReadingItem> readingItemList=ReadingItem.list()
        println readingItemList

//        List<Resource> resources=Resource.findAllWhere(readingItem.isRead=false)

    }


//    def createTopPosts(Resource resource)
//    {
//        List<ReadingItem> readingItemList=ReadingItem.findAllBy()
//
//    }

}
