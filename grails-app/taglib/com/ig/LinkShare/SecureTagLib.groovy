package com.ig.LinkShare

class SecureTagLib {
    def springSecurityService
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "secUser"

    def fullName={attrs,body->
        if(springSecurityService.isLoggedIn())
        {
            out<<springSecurityService.currentUser.fullName
        }
    }
}
