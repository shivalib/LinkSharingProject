package com.ig.LinkShare

class ApplicationFilters {

    def filters = {

        loginCheck(controller: 'home|user|image', actionExclude: 'index|forgotPassword|resetPassword|resetThePassword|resetPasswordLink|registerUser|showRecentShare|renderImage|showTopPosts', action: '*') {
            before = {
                if (!session.username) {
                    println "-- in filter --"
                    flash.message = "Login to the system!"
                    redirect(controller: "home", action: "index")
                }
            }
        }

        all(controller: '*', action: '*') {
            before = {
                log.info("Request parameter : $params")

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
