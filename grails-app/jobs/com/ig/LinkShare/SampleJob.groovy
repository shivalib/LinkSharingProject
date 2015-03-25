package com.ig.LinkShare



class SampleJob {
    static triggers = {
//      simple repeatInterval: 5000l // execute job once in 5 seconds
        cron name: 'myTrigger',cronExpression: "0 0/1 * 1/1 * ? *"
    }

    def execute() {

        // execute job
//        println "Job run"

    }
}
