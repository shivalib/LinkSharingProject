package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO

class LoginController {

    def loginHandler(String email, String password, Boolean active) {

        if (User.findByEmailAndPasswordAndActive(email, password, active = true)) {
            User user = User.findWhere(email: email)
            session["username"] = user.username
            redirect(controller: "home", action: "dashboard", params: [username: session["username"]])
        } else {
            flash.message = "Invalid username or password!"
            redirect(controller: "home", action: "index")
        }
    }

    def logout() {
        flash.message = "Goodbye ${session["username"]}"
        session["username"] = null
        redirect(controller: "home", action: "index")
    }

    def forgotPassword() {
        render(view: "forgotPassword")
    }

    def resetThePassword(UserCO userCO) {

        if (!userCO.validate()) {
            userCO.errors.allErrors.each {
                println it
            }

            flash.message = "Password updation failed!"

        } else {
            User user = User.findByEmail(params.emailID)
            user.password = params.password
            user.save(failOnError: true, flush: true)
            flash.message = "Password update Successfull!"
        }
        redirect(controller: "home", action: "index")

    }

    Boolean validateEmail() {

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

    Boolean validateUsername() {

        List<User> userList = User.createCriteria().list {
            projections {
                property("username")
            }
        }
        if (userList.contains(params.username)) {
            render false
        } else {
            render true
        }
    }


}
