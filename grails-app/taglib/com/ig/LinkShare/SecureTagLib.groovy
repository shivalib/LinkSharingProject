package com.ig.LinkShare

class SecureTagLib {
    def springSecurityService
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
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
        }
        else {
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
        def currentUser=springSecurityService.currentUser

        currentUser
    }
}
