package com.ig.LinkShare

class HomeController {

    def index() {
        render(view: "/user/HomePage")
    }

    def dashboard(String username)
    {
        render(view: "/user/Dashboard",params:[username:username])

    }

    def calculateRecentShare(Resource resource)
    {

    }
}
