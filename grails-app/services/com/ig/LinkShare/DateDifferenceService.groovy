package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class DateDifferenceService {
//
//    def serviceMethod() {
//
//    }
    def calculateDifferenceBetweenDate(Resource resource){
        def now=new Date()
        println now
        println "current Day : " +now.day
        println "currentMonth : "+now.getMonth()
        println "currentYear :"+now.getYear()

        def resourceCreationDate=resource.dateCreated
        println resourceCreationDate
        println "---------- resource Creation : "
        println "Day :" +resourceCreationDate.day
        println "Month :" +resourceCreationDate.month
        println "Year :"+resourceCreationDate.year
    }

}
