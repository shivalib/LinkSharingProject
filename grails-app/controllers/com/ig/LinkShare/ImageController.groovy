package com.ig.LinkShare

class ImageController {

//    def index() {}

    def renderImage(){
        String imagePath=params.path
        File file=new File(imagePath)
        response.contentLength=file.bytes.length
        response.outputStream<<file.bytes
        response.outputStream.flush()

    }
}
