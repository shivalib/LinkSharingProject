/**
 * Created by intelligrape on 17/3/15.
 */

$(document).ready(function () {

    $('#myform').validate({
        rules:{
            username:{
                required:true
            },
            password:{
                required:true
            }
        }
    })

});
