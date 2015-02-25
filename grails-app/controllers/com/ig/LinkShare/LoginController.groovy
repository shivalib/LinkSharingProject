package com.ig.LinkShare

class LoginController {

    def index() {
        render(view: "/user/HomePage")

    }

    def loginHandler(String username,String password) {
        if (User.findByUsernameAndPassword(username, password) )
        {
            //println "Valid user"
            session["username"] = "${params.username}"
            println session["username"]

            redirect(controller: "home", action: "dashboard" ,params: [username:username])
        }
        else {
            //println "Invalid user"
            redirect(controller: "login" )
        }
    }

    def registerUser(User user)
    {
        user.active=true
        user.admin=false

        println user.validate()

        if(!user.save(failOnError: true))
        {
        render "Registration Failed"
        }
        else
        {
            redirect(controller:"login" ,action: "index")
        }
    }
}
