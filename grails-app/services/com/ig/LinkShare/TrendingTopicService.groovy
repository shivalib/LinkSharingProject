package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional

@Transactional
class TrendingTopicService {

    List<Topic> showTrendingTopics() {
        List<Topic> trendingTopics=Topic.list(max:5,offset: 0).sort{

            it.resources.size()
        }.reverse()


        return  trendingTopics

    }
}
