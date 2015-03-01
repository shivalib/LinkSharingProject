package LinkShareCmdObjects
/**
 * Created by intelligrape on 27/2/15.
 */
class RegisterUserCommand {
    String firstName
    String lastName
    String username
    String password
    String confirmPassword
    String email
    Byte photo
    Boolean admin
    Boolean active

    static constraints = {
        firstName blank: false, nullable: false
        lastName blank: false, nullable: false
        username blank: false, nullable: false
        password blank: false, nullable: false
        email email: true, blank: false, unique: true
        photo nullable: true

        confirmPassword blank:false ,validator:{val,obj->
            if(!(val==obj.password))
            {
                return "password mismatch"
            }
        }


    }


}
