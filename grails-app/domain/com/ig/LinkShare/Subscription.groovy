package com.ig.LinkShare

import LinkShareEnums.Seriousness
import com.ig.LinkShare.Topic
import com.ig.LinkShare.User

class Subscription {

    Seriousness seriousness

    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }
}
