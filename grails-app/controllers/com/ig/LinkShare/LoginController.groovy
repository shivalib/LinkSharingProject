package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO

class LoginController {

    def index() {

    }

    def loginHandler(String username, String password) {
        println "************************* login handler "
        if (User.findByUsernameAndPassword(username, password)) {
            session["username"] = "${params.username}"
            println session["username"]
//            render( view: "/home/dashboard",model: [username: username])
            redirect(controller: "home",action: "dashboard",params: [username:username])
        }
        else
        {
            flash.message="Invalid username or password!"
            redirect(controller: "home",action: "index")
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

    def forgotPassword() {
        println "--------in forgot password----------"
        render(view: "forgotPassword")
    }

    def resetPassword(UserCO userCO){
        println "in reset password!!!!!!!"
//        User currentUser=
    }


}
