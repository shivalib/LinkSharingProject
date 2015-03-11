package com.ig.LinkShare

class ReadingItem {

    boolean isRead

    static belongsTo = [resource:Resource,user:User]

    static constraints = {

    }
}
