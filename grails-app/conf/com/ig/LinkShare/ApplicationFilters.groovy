package com.ig.LinkShare

class ApplicationFilters {

    def filters = {


        all(controller: '*', action: '*') {
            before = {
                log.info("Request parameter : $params")

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

        notloginCheck(controller: '(login|user|home|assets)', action: '(loginHandler|registerUser|logout|loginPage|index)',controllerExclude:'user', invert: true) {
            before = {
                println "loginCheck : in before"
                println params
                println "**************************************************"

                if (!session.username) {
                    flash.message = "Please login to the system"

                    println "in validating session ----------redirecting to controller"
                    redirect(controller: "home", action: "index")
                }

            }
        }


    }
}
