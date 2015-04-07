package com.ig.LinkShare

class lsMailController {

    def sendInvite() {

        sendMail {
//            async true
            to "${params.emailID}"
            subject "Invite : Subscription"
            body "${params.topicList}"
        }

        redirect(controller: "home", action: "dashboard")
    }

    def resetPasswordLink() {
        sendMail {
//            async true
            to "${params.emailID}"
            subject "Reset : Password"
            html "${g.link(controller: "user", action: "resetPassword", params: [emailID: params.emailID], absolute: "true", { "click on the link to change your password" })}"
        }
        flash.message = "Link to reset password have been sent to ${params.emailID}"
        redirect(controller: "login", action: "forgotPassword")
    }

//    def confirmRegistrationMail(User user){
//        UserToken userToken=UserToken.findWhere(user:user)
//
//        sendMail{
//            to "${user.email}"
//            subject "Required Confirmation : LinkShare"
//            html "${g.link(controller: "home",action: "activateRegisteredUser",params: [userToken:userToken], absolute: true,{ "click on this link to confirm" } )}"
//        }
//    }


}
