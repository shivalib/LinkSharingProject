package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO

class LoginController {

    def loginHandler(String email, String password, Boolean active) {
        if (User.findByEmailAndPasswordAndActive(email, password, active = true)) {
            User user = User.findWhere(email: email)
            session["userID"] = user.id
            redirect(controller: "home", action: "dashboard")
        } else {
            flash.message = "Invalid username or password!"
            redirect(controller: "home", action: "index")
        }
    }

    def logout() {
        flash.message = "You have been successfully logged out!"
        session["userID"] = null
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
            flash.message = "Password update Successful!"
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
