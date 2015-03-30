package com.ig.LinkShare.applicationEnums

import grails.validation.Validateable

@Validateable
class UserCO {
    String password
    String confirmPassword

    static constraints={
        confirmPassword nullable: false,blank: false
        password nullable: false,blank: false,validator: {val,obj->
            if(val.equals(obj.confirmPassword))
            {
                return true
            }
            else
            {
                return false
            }
        }

    }
}
