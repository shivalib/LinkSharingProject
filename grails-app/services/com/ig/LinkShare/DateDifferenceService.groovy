package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class DateDifferenceService {

     public  static Map getDifferenceInDates(Date resourceCreated, Date newDate = new Date()) {
         println ">>>>>>>>>> resourceCreated : "+resourceCreated
         println ">>>>>>>>>> newDate : "+newDate
        Long difference = newDate.time - resourceCreated.time
        Map diffMap =[:]
        difference = difference / 1000
        diffMap.seconds = difference % 60
        difference = (difference - diffMap.seconds) / 60
        diffMap.minutes = difference % 60
        difference = (difference - diffMap.minutes) / 60
        diffMap.hours = difference % 24
        difference = (difference - diffMap.hours) / 24
        diffMap.years = (difference / 365).toInteger()
        if(diffMap.years)
            difference = (difference) % 365
        diffMap.days = difference % 7
        diffMap.weeks = (difference - diffMap.days) / 7
        return diffMap
    }

}
