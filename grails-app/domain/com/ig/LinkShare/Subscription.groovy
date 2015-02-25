package com.ig.LinkShare

import LinkShareEnums.Seriousness
import com.ig.LinkShare.Topic
import com.ig.LinkShare.User

class Subscription {
    Topic topic
    Date dateCreated
    Seriousness seriousness

    static belongsTo = [user:User]

    static constraints = {
    }}
