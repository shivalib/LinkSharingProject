<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forgot Password</title>
    <meta name="layout" content="loginLayout">
</head>
<body>
<div>
    <g:form name="emailForm" controller="lsMail" action="resetPasswordLink">
        <center>
            <div>
                <span>Enter a valid email id :</span>
                <g:textField name="email"/>
            </div>
            <br>
            <div>
                <g:submitButton name="submit" value="Submit"/>
            </div>
        </center>
    </g:form>
</div>
</body>
</html>