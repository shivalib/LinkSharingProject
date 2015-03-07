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


            List<Subscription> subscriptionList=Subscription.findAllWhere(user: currentUser)

            List<Subscription> subscriptionList1=Subscription.createCriteria().list {


            }

            render(view: "/user/Dashboard", model: [loginUser:currentUser,topicList:topics.topicName,subscriptionList:subscriptionList])
        }
    }

    def demo() {

        List resourceSize=[]
        List<User> userList = User.list()
        userList.each { User user1 ->
            println user1
            List<Topic> listTopic = Topic.findAllWhere(createdBy: user1)
            listTopic.each { Topic topic ->
                println topic
                List<Resource> resourceList = Resource.findAllWhere(topic: topic)
                println resourceList.size()
                resourceSize.add(resourceList.size())

            }
        }

        println "List of resource size : "+resourceSize

        resourceSize.sort().each {println it}


//        redirect(controller: "home", action: "dashboard",params: [resourceSize:resourceSize])
    }
//    }


}
