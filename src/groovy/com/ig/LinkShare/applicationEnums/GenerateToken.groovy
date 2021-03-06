package com.ig.LinkShare.applicationEnums

import com.ig.LinkShare.User
import com.ig.LinkShare.UserToken
import grails.plugin.springsecurity.annotation.Secured


class GenerateToken {

    def generator = { String alphabet, int n ->
        new Random().with {
            (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
        }
    }

    void generateTokenForRegisteredUser(User user){
            def tokenGen = generator( (('A'..'Z')+('0'..'9')).join(), 10 )
            UserToken userToken=new UserToken(user:user,token:tokenGen,used: false)
            userToken.save(failOnError: true,flush: true)
    }


}
