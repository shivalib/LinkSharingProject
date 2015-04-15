<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>LinkSharing Home</title>
    <meta name="layout" content="dashboardLayout">
    <asset:javascript src="jquery.validate.min(1).js"/>
    <asset:javascript src="homePage.js"/>

</head>

<body>
<g:render template="/resource/socialIconJS"/>

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

    <!-- Top Posts-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Top Posts
                    <span class="right">
                        <g:select name="timeBasedData" from="${com.ig.LinkShare.applicationEnums.TimeBasedContent}"
                                  data-changeDataOnTimeBasis="${createLink(controller: "home", action: "showTopPosts")}"/>
                    </span>

                </h3>
            </div>

            <div class="panel-body topPostDiv">
                %{--<ls:showTopPost resource="${res}"/>--}%
            </div>

        </div>

    </div><!--col 8 end-->
    <div class="col-md-4">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Login</h3>
            </div>

            <div class="panel-body">
                <div id='login'>
                    <div class='inner'>
                        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                            <p>
                                <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                                <input type='text' class='text_' name='j_username' id='username'/>
                            </p>

                            <p>
                                <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                                <input type='password' class='text_' name='j_password' id='password'/>
                            </p>

                            <p id="remember_me_holder">
                                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                                       <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                <label for='remember_me'><g:message
                                        code="springSecurity.login.remember.me.label"/></label>
                            </p>
                            <p>
                                <input type='submit' id="submit"
                                       value='${message(code: "springSecurity.login.button")}'/>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>


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
<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
