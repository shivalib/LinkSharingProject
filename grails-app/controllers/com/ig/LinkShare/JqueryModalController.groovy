package com.ig.LinkShare

import java.text.SimpleDateFormat

class JqueryModalController {

    def index() {
        render(view: "/dialogDemo")
    }

    def getContentForDialog = {
        def now = new SimpleDateFormat("yyyy-dd-MM hh:mm:ss").format(new Date())
        println "getting content... " + now
        render(template:"/myTemplates/myContent", model:[now:now])
    }


}
