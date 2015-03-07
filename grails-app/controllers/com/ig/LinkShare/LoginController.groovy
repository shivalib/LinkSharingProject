package com.ig.LinkShare

class LoginController {

    def index() {

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
            flash.message="Invalid username or password"
            //......println "Invalid user"
            redirect(controller: "home",action: "index" )
        }
    }

    def logout()
    {
        flash.message = "Goodbye ${session["username"]}"
        session["username"] = null
//        session.invalidate()
        redirect(controller:"home",action: "index")
    }
}
