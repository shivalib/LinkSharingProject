package com.ig.LinkShare

class ReadingItem {
    //User user
    boolean isRead

    static belongsTo = [resource:Resource,user:User]

    static constraints = {

    }
}
