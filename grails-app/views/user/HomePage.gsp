<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 12:48 AM
--%>

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
            <div class="panel-heading" >
                <h1 class="panel-title">Recent shares</h1>
            </div>
            <div class="panel-body">
                    %{--Using template for media objects--}%
                    <g:each in="${resources}" var="res">
                        <g:render template="/myTemplates/RecentShare" model="[res:res]"></g:render>
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
                        <g:render template="/myTemplates/RecentShare" model="[res:res]"></g:render>
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
                <g:form class="loginform" controller="login" action="loginHandler">
                    <div>
                        <span>Email/Username*</span>
                        <input type="text" name="username"/>
                    </div>
                    <div>
                        <span>Password*</span>
                        <input type="password" name="password"/>
                    </div>
                    <div>
                        <a href="" class =left>Forgot Password</a>
                        <input type="submit" value="Login" class="right"/>
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
            <g:form class="loginform" controller="user" action="registerUser" method="post">
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

                    <input id="uploadFile" placeholder="Choose File" disabled="disabled" class="browsebar" />
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

</body>
</html>
