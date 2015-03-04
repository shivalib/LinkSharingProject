package com.ig.LinkShare
//import grails.plugin.mail.*

class MyMailController {

    def index() {}

    def testAction() {
        println "all is fine here"
        println "in sendMail"

        sendMail {
//            async true
            to "batra.shivali@gmail.com"
            subject "test"
            body 'abc'
        }

        render("Sent!")
    }
}
