package com.ig.LinkShare

import com.ig.LinkShare.applicationEnums.Seriousness


class WeeklyJob {
    def mailService
    static triggers = {
//      simple repeatInterval: 5000l // execute job once in 5 seconds
        cron name: 'mailJob', cronExpression: ' \t0 45 18 ? * WED *'
    }

    def execute() {

//        List<Subscription> subscriptionList = Subscription.findAllBySeriousness(Seriousness.VERYSERIOUS)
//
//        subscriptionList.each { subscription ->
//
//            List<ReadingItem> readingItems = ReadingItem.createCriteria().list(offset:0,max:10) {
//                eq('isRead', false)
//                eq('user', subscription.user)
//            }
//
//            mailService.sendMail {
//                to subscription.user.email
//                subject 'Subscription Update'
//                body 'readingItem list : '
//            }
//        }
    }
}
