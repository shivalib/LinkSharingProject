<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="loginLayout">
</head>

<body>
<div>
    <g:form controller="lsMail" action="resetPasswordLink">
        <center>
            <div>
                <span>Enter a valid email id :</span>
                <g:textField name="emailID"/>
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