<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Reset Password</title>
    <meta name="layout" content="loginLayout"/>
</head>

<body>
<g:form class="loginform" controller="login" action="resetThePassword" params="[emailID: emailID]">
    <div>
        <span>Password* :</span>
        <g:passwordField name="password"/>
    </div>

    <div>
        <span>Confirm Password* :</span>
        <g:passwordField name="confirmPassword"/>
    </div>

    <div>
        <g:submitButton name="update" value="Update"/>
    </div>
</g:form>
</body>
</html>