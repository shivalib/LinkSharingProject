package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TrendingTopicService {

    List<Topic> showTrendingTopics(int max, int offset) {
        List<Topic> trendingTopics = Topic.list(max: max, offset: offset).sort {

            it.resources.size()
        }.reverse()

        return trendingTopics
    }
}
