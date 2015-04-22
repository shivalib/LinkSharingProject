package com.ig.LinkShare

class lsMailController {

    def sendInvite(Long id) {
        Topic topic = Topic.get(id)

        sendMail {
            to "${params.emailID}"
            subject "Invite : Subscription"
            html "${g.link(controller: "topic", action: "index", id: id, absolute: "true", { "Have a look at this topic" })}"

        }

        redirect(controller: "home", action: "dashboard")
    }

    def sendInviteFromList() {

        sendMail {
            to "${params.emailID}"
            subject "Invite : Subscription"
            body "${params.topicList}"
        }

        redirect(controller: "home", action: "dashboard")
    }

    def resetPasswordLink() {
        User user = User.findByEmail(params.email)
        if (!user) {
            flash.message = "Sorry, no such emailID exists. Please enter a valid emailID"
            redirect(controller: 'login', action: 'forgotPassword')
        } else {
            UserToken userToken = UserToken.findByUser(user)

            sendMail {
                to "${params.email}"
                subject "Reset : Password"
                html "${g.link(controller: "user", action: "resetPassword", id: "${userToken.id}", absolute: "true", { "click on the link to change your password" })}"
            }
            flash.message = "Link to reset password have been sent to ${params.email}"
            redirect(controller: "login", action: "forgotPassword")
        }
    }

}
