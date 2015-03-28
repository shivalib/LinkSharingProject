package com.ig.LinkShare.applicationEnums

public enum timeBasedContent {
    TODAY,
    WEEK,
    MONTH,
    YEAR

    String timeBased

    timeBasedContent(String s){
        this.timeBased=s
    }
}