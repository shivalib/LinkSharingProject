<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout">
    <asset:javascript src="jquery.validate.min(1).js"/>
    <asset:javascript src="homePage.js"/>
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
                <g:each in="${resources}" var="res">
                    <ls:showListingPages resource="${res}"/>
                </g:each>

            </div><!--panel body end -->
        </div><!--panel end-->


        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Top Posts
                <g:select name="timeBasedData" from="${timeBasedContent}"/>
                </h3>
            </div>

            <div class="panel-body">
                <g:each in="${topPost}" var="res">
                    <ls:showListingPages resource="${res}"/>
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
                <g:form class="loginform" name="login" controller="login" action="loginHandler">
                    <div>
                        <span>Email*</span>
                        <g:textField name="email" id="emailID"/>
                    </div>

                    <div>
                        <span>Password*</span>
                        <g:passwordField name="password"/>
                    </div>

                    <div>
                        <g:link controller="login" action="forgotPassword" class="left">Forgot Password</g:link>
                        <g:submitButton name="submit" id="submitLogin" class="right" value="Submit"
                                        data-emailValidate="${createLink(controller: "login", action: "validateEmail")}"/>
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
                <g:form class="loginform " name="registerForm" controller="user" action="registerUser"
                        enctype="multipart/form-data">
                    <div>
                        <span>First name*</span>
                        <g:textField name="firstName" placeholder="First Name"/>
                    </div>

                    <div>
                        <span>Last name*</span>
                        <g:textField name="lastName" placeholder="Last Name"/>
                    </div>

                    <div>
                        <span>Email*</span>
                        <g:textField name="email" placeholder="Email"/>
                    </div>

                    <div>
                        <span>Username*</span>
                        <g:textField name="username" id="checkUsername"
                                     data-checkUsername="${createLink(controller: "login", action: "validateUsername")}"
                                     placeholder="Username"/>
                    </div>

                    <div>
                        <span>Password*</span>
                        <g:passwordField name="password" placeholder="password"/>
                    </div>

                    <div>
                        <span>Confirm Password*</span>
                        <g:passwordField name="confirmPassword" placeholder="confirmPassword"/>
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
        </div><!--registration form ends-->
    </div><!-- col 4 end-->
</div><!--Ending div -->
</body>
</html>
