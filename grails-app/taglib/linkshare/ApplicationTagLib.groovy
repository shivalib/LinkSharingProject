package linkshare

import LinkShareEnums.Visibility
import com.ig.LinkShare.Subscription
import com.ig.LinkShare.User

class ApplicationTagLib {

    static namespace = "ls"

    static defaultEncodeAs=[taglib : 'raw']
//    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

//    def isEditable={attr,body->
//        out<<body()<<(attr.happy=="true"?"happy" :"sad")
//    }

    def isEditable = { attr, body ->

        def currentUser = attr.currentUser
        def topicCreater = attr.topicCreater
        def isAdmin=attr.isAdmin

        if (currentUser==topicCreater | isAdmin==true ) {
            out<<g.render(template: "/myTemplates/isEditable")
        }
    }

    def showListingPages={attr->
        out<<g.render(template: "/myTemplates/RecentShare",model: [res:attr.resource])
    }

    def topicListing={attr->
        def loginUser=attr.loginUser
        out<<g.render(template: "/myTemplates/showTopic",model: [topics:attr.topics,loginUser:loginUser])
    }

    def isSubscribed={attr->
        def user=attr.userID
        User user1=User.findByUsername(user)
        def topic=attr.topicID

        Subscription subscription=Subscription.findByUserAndTopic(user1,topic)

        if(subscription)
        {
            out<<g.render(template: '/myTemplates/isSubscribed')
        }
   }

    def isNotSubscribed={attr->
        def user=attr.userID
        User user1=User.findByUsername(user)
        def topic=attr.topicID
        Subscription subscription=Subscription.findByUserAndTopic(user1,topic)
        if(!subscription)
        {
            out<<g.render(template: '/myTemplates/isSubscribed')
        }
    }
}
