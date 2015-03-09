package linkshare

import LinkShareEnums.Visibility

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

        if (currentUser == topicCreater) {

            out << "<img src='${resource(dir: 'images',file: '512px-Edit_font_awesome.svg.png')}' class=iconSize/>"
            out << "<img src='${resource(dir: 'images',file: 'Gnome-edit-delete.svg.png')}'/>"
            out << g.select(name:"topicType" ,from:Visibility)
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
        def userID=attr.userID
        def subscriptionList=attr.subscriptionList

        subscriptionList.each
                {
                    if(userID==it.user.id)
                    {
                        out<<g.render(template: '/myTemplates/isSubscribed')
                    }
                }
    }


    def isNotSubscribed={attr->
        def userID=attr.userID
        def subscriptionList=attr.subscriptionList

        subscriptionList.each
                {
                    if(userID!=it.user.id)
                    {
                        out<<g.render(template: '/myTemplates/isNotSubscribed')
                    }
                }
    }


}
