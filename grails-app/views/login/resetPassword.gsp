
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="loginLayout"/>
</head>
<body>
.................${emailID}
    <g:form class="loginform">
        <div>
            <span>Password* :</span>
            <g:textField name="password"/>
        </div>
        <div>
            <span>Confirm Password* :</span>
            <g:textField name="confirmPassword"/>
        </div>
        <div>
            <g:submitButton name="update" value="Update"/>
        </div>
    </g:form>
</body>
</html>