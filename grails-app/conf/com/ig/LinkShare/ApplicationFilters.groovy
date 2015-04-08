package com.ig.LinkShare

class ApplicationFilters {

    def filters = {

        loginCheck(controller: 'home|user|image',actionExclude: 'index|forgotPassword|searchPage|activateRegisteredUser|resetPassword|resetThePassword|resetPasswordLink|registerUser|paginateRecentShare|renderImage|showTopPosts', action: '*') {
            before = {
                if (!session.userID) {
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
