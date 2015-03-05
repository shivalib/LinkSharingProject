package com.ig.LinkShare

class LoginController {

    def index() {
        render(view: "/user/HomePage")

    }

    def loginHandler(String username,String password) {
        if (User.findByUsernameAndPassword(username, password) )
        {
            //...........println "Valid user"
            session["username"] = "${params.username}"
            println session["username"]

            redirect(controller: "home", action: "dashboard" ,params: [username:username])
        }
        else {
            //......println "Invalid user"
            redirect(controller: "login" )
        }
    }

    def logout()
    {
        flash.message = "Goodbye ${session["username"]}"
        session["username"] = null
        redirect(controller:"home",action: "index")
    }
}
