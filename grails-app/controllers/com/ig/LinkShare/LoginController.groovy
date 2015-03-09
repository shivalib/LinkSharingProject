package com.ig.LinkShare

class LoginController {

    def index() {

    }

    def loginHandler(String username, String password) {
        println "************************* login handler "
        if (User.findByUsernameAndPassword(username, password)) {
            session["username"] = "${params.username}"
            println session["username"]

            redirect(controller: "home", action: "dashboard", params: [username: username])
        } else {
            println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>. invalidating the login requested by the user "
            flash.message = "Invalid username or password"
            redirect(controller: "home", action: "index")
        }
    }

    def logout() {
        flash.message = "Goodbye ${session["username"]}"
        session["username"] = null
//        session.invalidate()
        redirect(controller: "home", action: "index")
    }

    def loginPage() {
        render "We are at login page........."
    }
}
