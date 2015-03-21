package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO

class LoginController {
    def index() {


    }

    def loginHandler(String email, String password) {
        if (User.findByEmailAndPassword(email, password)) {

            User user = User.findWhere(email: email)
            session["username"] = user.username
            println session["username"]
            redirect(controller: "home", action: "dashboard", params: [username: session["username"]])
        } else {
            flash.message = "Invalid username or password!"
//            redirect(controller: "home", action: "index")
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

    Boolean validateEmail() {
        println "##### in validate email ####"

        List<User> userList = User.createCriteria().list {
            projections {
                property("email")
            }
        }

        if (userList.contains(params.email))
            render true
        else
            render false
    }


}
