package com.ig.LinkShare

class ApplicationFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                log.info("Request parameter : $params")

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }

       notloginCheck(controllerExclude:'Login',action: 'loginHandler|registerUser'){
          before= {
              if (!session["username"] && !actionName.equals('loginHandler|registerUser')) {
                  flash.message="Please login to the system"
                  redirect(controller: 'login',action: "loginHandler")
                    return false
              }

          }
       }


        paramLogger(controller: '*',action: '*')
                {
                    before={
                        log.debug "request params : $params"
                    }
                }

        onlyAdmin(controller: 'user',action: 'list')
                {
                    before={
                        accessControl{
                            User.findAllByAdmin(true)
                        }
                    }
                }
    }
}
