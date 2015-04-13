import com.ig.LinkShare.SecRole
import com.ig.LinkShare.SecUser
import com.ig.LinkShare.SecUserSecRole

class BootStrap {

    def init = { servletContext ->

        def adminUser=SecUser.findByUsername('admin')?:new SecUser(username: 'admin',password: 'admin').save(failOnError: true,flush: true)
        def basicUser=SecUser.findByUsername('guest')?:new SecUser(username: 'guest',password: 'guest').save(failOnError: true,flush: true)

        def userRole=SecRole.findByAuthority('ROLE_USER')?:new SecRole(authority: 'ROLE_USER').save(failOnError: true,flush: true)
        def adminRole=SecRole.findByAuthority('ROLE_ADMIN')?:new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true,flush: true)

        if(!adminUser.authorities.contains(adminRole)){
            SecUserSecRole.create(adminUser,adminRole)
        }

        if(!basicUser.authorities.contains(userRole)){
            SecUserSecRole.create(basicUser,userRole)
        }


    }

    def destroy = {
    }


}