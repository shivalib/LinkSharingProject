<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="loginLayout">

</head>

<body>
<div class="row">
    <div class="col-md-8">

        <!--Recent Shares-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h1 class="panel-title">Recent shares</h1>
            </div>

            <div class="panel-body">

                %{--Using self created tag--}%
                <g:each in="${resources}" var="res">

                    <ls:showListingPages resource="${res}"/>

                </g:each>

            </div><!--panel body end -->
        </div><!--panel end-->


        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Top Posts</h3>
            </div>

            <div class="panel-body">
                %{--Using template for media objects--}%
                <g:each in="${resources}" var="res">
                    <g:render template="/myTemplates/RecentShare" model="[res: res]"></g:render>
                </g:each>

            </div>
        </div>

    </div><!--col 8 end-->
    <div class="col-md-4">

        <!--LOGIN FORM-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Login</h3>
            </div>

            <div class="panel-body">
                <g:form class="loginform" id="myform" controller="login" action="loginHandler">
                    <div>
                        <span>Email/Username*</span>
                        <input type="text" name="username"/>
                    </div>

                    <div>
                        <span>Password*</span>
                        <input type="password" name="password"/>
                    </div>

                    <div>
                        <a href="" class=left>Forgot Password</a>
                        <g:submitButton name="submit" class="right" value="Submit"/>
                    </div>
                </g:form>
            </div>
        </div><!--login form ends -->

    <!--REGISTERATION FORM-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Register</h3>
            </div>

            <div class="panel-body">
                <g:form class="loginform" id="registerForm" controller="user" action="registerUser" enctype="multipart/form-data">
                    <div>
                        <span>First name*</span>
                        <g:textField name="firstName" placeholder="First Name"></g:textField>
                    </div>

                    <div>
                        <span>Last name*</span>
                        <g:textField name="lastName" placeholder="Last Name"></g:textField>
                    </div>

                    <div>
                        <span>Email*</span>
                        <g:textField name="email" placeholder="Email"></g:textField>
                    </div>

                    <div>
                        <span>Username*</span>
                        <g:textField name="username" placeholder="Username"></g:textField>
                    </div>

                    <div>
                        <span>Password*</span>
                        <g:passwordField name="password" placeholder="password"></g:passwordField>
                    </div>

                    <div>
                        <span>Confirm Password*</span>
                        <g:passwordField name="confirmPassword" placeholder="confirmPassword"></g:passwordField>
                    </div>

                    <div>
                        <span>Photo</span>
                        <input type="file" name="img" class="btn-default">
                    </div>

                    <div>
                        <g:submitButton name="submit" value="Register"/>
                    </div>
                </g:form>
            </div>
        </div><!--registeration form ends-->
    </div><!-- col 4 end-->
</div><!--Ending div -->
<script>
        $('#myform').validate({
            rules:{
                username:{
                    required:true
                },
                password:{
                    required:true
                }
            }
        });

</script>
</body>
</html>
