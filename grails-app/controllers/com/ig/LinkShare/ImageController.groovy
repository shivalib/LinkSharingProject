package com.ig.LinkShare

import grails.plugin.springsecurity.annotation.Secured

class ImageController {
    @Secured(['ROLE_ADMIN'])
    def renderImage() {
            String imagePath = params.path
            File file = new File(imagePath)
            response.contentLength = file.bytes.length
            response.outputStream << file.bytes
    }
}
