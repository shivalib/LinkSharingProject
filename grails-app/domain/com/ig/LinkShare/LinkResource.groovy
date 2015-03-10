package com.ig.LinkShare

class LinkResource extends Resource {
    String linkUrl

    static constraints = {
        linkUrl url: true,unique: "topic"
    }

}
