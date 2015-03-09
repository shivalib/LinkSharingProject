package com.ig.LinkShare

class ApplicationFilters {

    def filters = {


        all(controller: '*', action: '*') {
            before = {
//                println "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
//                println "in before"
                log.info("Request parameter : $params")

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

//        notloginCheck(controllerExclude: '(login|user)',action: '(loginHandler|registerUser)') {
//            before = {
//                println "loginCheck : in before"
//                println session.username
//                println "**************************************************"
//
//              if (!session.username) {
//
//                  println "not session"
////                    println "----------printing flash message"
//
////                  println "----------redirecting to controller"
//                  redirect(controller: 'login',action: 'loginHandler')
//                  flash.message="Please login to the system"
//                    return false
//              }
//
//            }
//        }

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

//        paramLogger(controller: '*',action: '*')
//                {
//                    before={
//                        log.debug "request params : $params"
//                    }
//                }
//
//        onlyAdmin(controller: 'user',action: 'list')
//                {
//                    before={
//                        accessControl{
//                            User.findAllByAdmin("true")
//                        }
//                    }
//                }
    }
}
