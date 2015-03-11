package com.ig.LinkShare

import grails.transaction.Transactional
import org.springframework.web.context.request.RequestContextHolder

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

@Transactional
class UserService {

    static transactional = false
    static scope = "singleton"

    String getLoggedInUserEmail() {
        return session["userEmail"].toString()
    }
    
    String getLoggedInUsernameFromSession(){

        return  session["username"]
    }

    //user object
    User getUserFromSession() {
        User.findByUsername(getLoggedInUserEmail())
    }

    private static HttpSession getSession() {
        return RequestContextHolder.currentRequestAttributes().getSession()
    }
}

