import com.ig.LinkShare.SecRole
import com.ig.LinkShare.SecUserSecRole
import com.ig.LinkShare.User

class BootStrap {

    def init = { servletContext ->

        def adminUser=User.findByUsername('admin')?:new User(firstName: 'shivali',lastName: 'batra',username: 'admin',password: 'admin',email: 'shivalib+admin@intelligrape.com').save(failOnError: true,flush: true)

        def basicUser=User.findByUsername('guest')?:new User(firstName: 'rahul',lastName: 'sharma',username: 'guest',password: 'guest',email: 'abc@gmail.com').save(failOnError: true,flush: true)

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