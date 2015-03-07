package com.ig.LinkShare

import LinkShareEnums.UserCO

class UserProfileController {

    def index() {
        if(session["username"]) {
            User currentUser = User.findByUsername(session["username"])

            List<Topic> topicList=Topic.findAllWhere(createdBy: currentUser)
            render(view: "/user/EditProfile", model: [loginUser: currentUser,topicList:topicList] )
        }
    }

    def changePassword(User user,UserCO userCO)
    {
       def currentUser=session["username"]

        if(!userCO.validate()) {
            userCO.errors.allErrors.each {
                println "Error in saving data"
            }

            flash.message = "Updation Failed : Password Mismatch"
            redirect(controller: "userProfile",action: "index")
        }
        else
        {
            User.executeUpdate("update User set password=:password where username=:username",[password:params.password,username:currentUser])
//            user.save(failOnError: true)
            flash.message="Your password has been updated successfully !!"
            redirect(controller:"userProfile",action: "index")
        }
    }

    def updateData()
    {
//        def currentUser=session["username"]
        User currentUser=User.findByUsername(session["username"])
        User.executeUpdate("update User set firstName=:firstName,lastName=:lastName,username=:username where id=:id",[firstName:params.firstName,lastName:params.lastName,username: params.username,id:currentUser.id])
        flash.message="Your data has been updated successfully !!"
        redirect(controller:"userProfile",action: "index")
    }


}
