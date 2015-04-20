package com.ig.LinkShare

import grails.plugin.springsecurity.SpringSecurityUtils

class SecureTagLib {
    def springSecurityService
//    static defaultEncodeAs = [taglib: 'html']
    static defaultEncodeAs='raw'
    static namespace = "secUser"

    def loggedInUserInfo = { attrs, body ->
        String field = assertAttribute('field', attrs, 'loggedInUserInfo')
        def source
        if (springSecurityService.isLoggedIn()) {
            source = determineSource()
            for (pathElement in field.split('\\.')) {
                source = source."$pathElement"
                if (source == null) {
                    break
                }
            }
        }

        if (source) {
            out << source.encodeAsHTML()
        } else {
            out << body()
        }
    }

    protected assertAttribute(String name, attrs, String tag) {
        if (!attrs.containsKey(name)) {
            throwTagError "Tag [$tag] is missing required attribute [$name]"
        }
        attrs.remove name
    }

    protected determineSource() {
        def currentUser = springSecurityService.currentUser
        currentUser
    }

    def ifAllGrantedRoleAndAction = { attrs, body ->
        String roles = assertAttribute('roles', attrs, 'ifAllGranted')
        if (SpringSecurityUtils.ifAllGranted(roles) && attrs.actionName == 'postsForAdmin') {
            out <<body()
        }
    }

    def ifAnyGrantedRoleAndAction = { attrs, body ->
        String roles = assertAttribute('roles', attrs, 'ifAnyGranted')
        if (SpringSecurityUtils.ifAnyGranted(roles) && attrs.actionName == 'index') {
            out << body()
        }
    }


}
