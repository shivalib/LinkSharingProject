package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO


class UserProfileController {

    def index() {
        if (session["username"]) {
            User currentUser = User.findByUsername(session["username"])

            List<Topic> topicList = Topic.findAllWhere(createdBy: currentUser)
            render(view: "/userProfile/editProfile", model: [loginUser: currentUser, topicList: topicList])
        }
    }

    def changePassword(User user, UserCO userCO) {
        def currentUser = session["username"]

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }

            flash.message = "Updation Failed : Password Mismatch"
        } else {
            User.executeUpdate("update User set password=:password where username=:username", [password: params.password, username: currentUser])
            flash.message = "Your password has been updated successfully !!"
        }

        redirect(controller: "userProfile", action: "index")
    }

    def updateData() {
        User currentUser = User.findByUsername(session["username"])
        User.executeUpdate("update User set firstName=:firstName,lastName=:lastName,username=:username where id=:id", [firstName: params.firstName, lastName: params.lastName, username: params.username, id: currentUser.id])
        flash.message = "Your data has been updated successfully !!"
        redirect(controller: "userProfile", action: "index")
    }


}
