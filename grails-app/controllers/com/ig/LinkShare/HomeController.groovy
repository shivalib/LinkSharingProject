package com.ig.LinkShare

class HomeController {

    def index() {

        List<Resource> resources=Resource.list([max:5,offset: 0,order:"desc",sort: "id"])

        render(view: "/user/HomePage",model:[resources:resources])

    }

    def dashboard() {
        if(session["username"])
        {
            User currentUser=User.findByUsername(session["username"])
       //     showInbox(currentUser)

            List<Topic> topics=Topic.findAllWhere(createdBy: currentUser)
            println topics.topicName



            render(view: "/user/Dashboard", model: [loginUser:currentUser,topicList:topics.topicName])
        }
    }


}
