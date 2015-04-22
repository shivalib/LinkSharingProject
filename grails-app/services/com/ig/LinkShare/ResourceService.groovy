package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Visibility
import grails.transaction.Transactional
import groovy.time.TimeCategory

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class ResourceService {

    List<Resource> showResourcesByTopic(Topic topic) {

        List<Resource> resourceList = Resource.findAllByTopic(topic)
        return resourceList
    }


    List<Resource> calculateResourceList(int max,int offset) {
        List<Resource> resources = Resource.createCriteria().list(max:max,offset:offset) {
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
            order('dateCreated','desc')
        }
        return resources
    }

    List<Resource> calculateResourceListForAdmin() {
        List<Resource> resources = Resource.createCriteria().list {
        }
        return resources
    }

    List<Resource> showTopPost(String selectedValue) {
            DateFormat srcDf = new SimpleDateFormat("dd/MM/yyyy")
            String date = srcDf.format(new Date())
            List<Resource> recentPosts = []
            use(TimeCategory) {
                if (selectedValue == "Today") {
                    recentPosts = Resource.list().findAll { srcDf.format(it.dateCreated) == date }.sort({
                        it.resouceRatings
                    }).reverse()
                }
                if (selectedValue == "Week") {
                    recentPosts = Resource.findAllByDateCreatedBetween((new Date() - 7), new Date())
                }
                if (selectedValue == "Month") {
                    recentPosts = Resource.findAllByDateCreatedBetween((new Date() - 1.month), new Date())
                }
                if (selectedValue == "Year") {
                    recentPosts = Resource.findAllByDateCreatedBetween((new Date() - 1.year), new Date())
                }
                recentPosts = recentPosts.size() < 5 ? recentPosts.asList() : recentPosts.subList(0, 3)
            }
            return recentPosts
    }
}
