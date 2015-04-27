import com.ig.LinkShare.Client
import com.ig.LinkShare.SecRole
import com.ig.LinkShare.SecUserSecRole
import com.ig.LinkShare.User

class BootStrap {

    def init = { servletContext ->
        SecRole roleUser = new SecRole(authority: 'ROLE_USER').save(flush: true)
        User user = new User(
                username: 'my-user',
                password: 'my-password',
                firstName: 'demo',
                lastName: 'last',
                email: 'batra.shivali@gmail.com',
                active: true,
                enabled: true,
                accountExpired: false,
                accountLocked: false,
                passwordExpired: false
        ).save(flush: true,failOnError: true)

        SecUserSecRole.create(user, roleUser, true)

        new Client(
                clientId: 'my-client',
                authorizedGrantTypes: ['authorization_code', 'refresh_token', 'implicit', 'password', 'client_credentials'],
                authorities: ['ROLE_CLIENT'],
                scopes: ['read', 'write'],
                redirectUris: ['http://myredirect.com']
        ).save(flush: true)
    }

}