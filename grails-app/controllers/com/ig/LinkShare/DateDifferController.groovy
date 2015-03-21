package com.ig.LinkShare

class DateDifferController {
    def userService
    def dateDifferenceService
//    def index() {}
    def calculateDifference(){

        User currentUser=userService.showCurrentUserObject(session["username"])

//        dateDifferenceService.calculateDifferenceBetweenDate(currentUser)
    }
}
