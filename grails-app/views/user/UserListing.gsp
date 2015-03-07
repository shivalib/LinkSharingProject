<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 7/3/15
  Time: 8:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<h4>User Listing</h4>

    <g:each in="${userList}" var="usr">
    <p> ${usr.firstName}</p>

    </g:each>
</body>
</html>