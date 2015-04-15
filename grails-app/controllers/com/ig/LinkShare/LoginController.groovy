package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.UserCO
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes

class LoginController {
    def springSecurityService
    def passwordEncoder

    def index() {
        if (springSecurityService.isLoggedIn()) {
        redirect uri: grailsApplication.config.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
    }

    def auth() {

        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: '/home/dashboard'
            return
        }

//        String view = 'homePage'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
//        render view: view, model: [postUrl: postUrl,
//                                   rememberMeParameter: config.rememberMe.parameter]
        redirect(controller: 'home',action: 'index',params: [postUrl: postUrl,rememberMeParameter: config.rememberMe.parameter])
    }

    def authfail() {

        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.expired")
            }
            else if (exception instanceof CredentialsExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.passwordExpired")
            }
            else if (exception instanceof DisabledException) {
                msg = g.message(code: "springSecurity.errors.login.disabled")
            }
            else if (exception instanceof LockedException) {
                msg = g.message(code: "springSecurity.errors.login.locked")
            }
            else {
                msg = g.message(code: "springSecurity.errors.login.fail")
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        }
        else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
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
