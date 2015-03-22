package com.ig.LinkShare

class ResourceRating {
    float score

    static belongsTo = [user:User,resource:Resource]
    static constraints = {
    }
}
