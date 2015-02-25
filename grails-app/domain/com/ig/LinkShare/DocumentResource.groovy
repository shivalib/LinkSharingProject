package com.ig.LinkShare

class DocumentResource extends Resource {

    String fileName
    String filePath


    static constraints = {
        fileName nullable: false,blank: false
        filePath nullable: false,blank: false
    }
}
