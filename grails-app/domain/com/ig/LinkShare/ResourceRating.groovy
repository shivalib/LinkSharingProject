package com.ig.LinkShare

class ResourceRating {
    Integer score

    static belongsTo = [user:User,resource:Resource]
    static constraints = {
    }
}
