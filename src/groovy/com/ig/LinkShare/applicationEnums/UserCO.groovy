package com.ig.LinkShare.applicationEnums

import grails.validation.Validateable

/**
 * Created by intelligrape on 3/3/15.
 */
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
