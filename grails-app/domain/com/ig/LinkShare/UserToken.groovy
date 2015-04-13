package com.ig.LinkShare

class UserToken {
    String token
    Boolean used

    static belongsTo = [user:User]
    static constraints = {
    }
}
