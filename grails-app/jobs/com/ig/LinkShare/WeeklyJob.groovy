package com.ig.LinkShare

class WeeklyJob {
    static triggers = {
        cron name: 'mailJob', cronExpression: ' \t0 45 18 ? * WED *'
    }

    def execute() {

    }
}
