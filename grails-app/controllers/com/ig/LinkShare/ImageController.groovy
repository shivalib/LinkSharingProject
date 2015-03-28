package com.ig.LinkShare

class ImageController {
    def renderImage() {
        if (params.path) {
            String imagePath = params.path
            File file = new File(imagePath)
            response.contentLength = file.bytes.length
            response.outputStream << file.bytes
        }

    }
}
