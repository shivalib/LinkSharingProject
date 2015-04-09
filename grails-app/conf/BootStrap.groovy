import com.ig.LinkShare.User
import com.ig.LinkShare.applicationEnums.GenerateToken

class BootStrap {

    def init = { servletContext ->
        GenerateToken generateToken = new GenerateToken()
        List<User> userList=User.list()
        userList.each {User user->
            generateToken.generateTokenForRegisteredUser(user)
        }
    }

    def destroy = {
    }


}