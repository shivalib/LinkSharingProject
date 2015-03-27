package com.ig.LinkShare
//import grails.plugin.mail.*

class lsMailController {

    def index() {}

    def sendInvite() {

        sendMail {
//            async true
            to "${params.emailID}"
            subject "Invite : Subscription"
            body "${params.topicList}"
        }

        redirect(controller: "home",action: "dashboard")
    }

    def resetPasswordLink() {
        sendMail {
//            async true
            to "${params.emailID}"
            subject "Reset : Password"
            html "${g.link(controller: "user", action: "resetPassword", params: [emailID: params.emailID], absolute: "true", { "click on the link to change your password" })}"
        }
        render "sent"
    }


}
