package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Seriousness

class Subscription {

    Seriousness seriousness

    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }
}
