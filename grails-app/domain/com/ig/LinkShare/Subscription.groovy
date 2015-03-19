package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Seriousness

class Subscription {

    Seriousness seriousness
    Date dateCreated

    static belongsTo = [user:User,topic:Topic]

    static constraints = {
    }
}
