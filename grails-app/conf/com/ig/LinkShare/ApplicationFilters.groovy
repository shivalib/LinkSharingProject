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

//        notloginCheck(controller: 'login|home',action: '*|index|showRecentShare',invert:true){
//            before = {
//                println "loginCheck : in before"
//                println params
//                println "**************************************************"
//
//                if (!session.username) {
//                    flash.message = "Please login to the system"
//
//                    println "in validating session ---------o-redirecting to controller"
//                    redirect(controller: "home", action: "index")
//                }
//
//            }
//        }

//        notloginCheck(controller: '(login|user|home|assets|lsMail)', action: '(loginHandler|registerUser|logout|resetPassword|forgotPassword|loginPage|index|resetPasswordLink)',controllerExclude:'user', invert: true) {
//            before = {
//                println "loginCheck : in before"
//                println params
//                println "**************************************************"
//
//                if (!session.username) {
//                    flash.message = "Please login to the system"
//
//                    println "in validating session ----------redirecting to controller"
//                    redirect(controller: "home", action: "index")
//                }
//
//            }
//        }


    }
}
