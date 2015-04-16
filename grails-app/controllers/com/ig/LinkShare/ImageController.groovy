package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class ImageController {
    def renderImage() {
            String imagePath = params.path
            File file = new File(imagePath)
            if(!file)
            {
                flash.message="Sorry, specified file is not found!"
                redirect(controller: 'home',action: 'dashboard')
            }
            response.contentLength = file.bytes.length
            response.outputStream << file.bytes
    }
}
