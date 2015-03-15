package com.ig.LinkShare
//import grails.plugin.mail.*

class MyMailController {

    def index() {}

    def sendInvite() {
        println "all is fine here"
        println "in sendMail"

        sendMail {
//            async true
            to "${params.emailID}"
            subject "Invite : Subscription"
            body "${params.topicList}"
        }

        render("Sent!")
    }
}
