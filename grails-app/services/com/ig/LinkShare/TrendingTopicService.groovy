package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TrendingTopicService {

    List<Topic> showTrendingTopics() {
        List<Topic> trendingTopics = Topic.list().sort {

            it.resources.size()
        }.reverse()

        return trendingTopics
    }
}
