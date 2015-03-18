package com.ig.LinkShare

class LoginController {

    def index() {

    }

    def loginHandler(String username, String password) {
        println "************************* login handler "
        if (User.findByUsernameAndPassword(username, password)) {
            session["username"] = "${params.username}"
            println session["username"]

            //todo :replace it with render
            redirect(controller: "home", action: "dashboard", params: [username: username])
        }
//        render(view: "/home/dashboard",model: [username: username])
    }

    def logout() {
        flash.message = "Goodbye ${session["username"]}"
        session["username"] = null
//        session.invalidate()
        //replace this with render
        redirect(controller: "home", action: "index")
    }


}
