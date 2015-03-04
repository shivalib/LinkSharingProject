<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 6:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Login Layout"/></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- Self-created CSS -->
    <link rel="stylesheet" href="${resource(dir: "css",file:"LinkShare.css" )}">

</head>
<g:layoutHead/>
<body>
<!--Navigation Bar-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Link Sharing</a>
        </div>
        <div>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
        </div>
        <!--Search-->
        <div>
            <form class="navbar-form navbar-right " role="search">${params.username}
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>

                <button type="button" class="btn btn-default btn-md" title="Create topic">
                    <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                </button>

                <button type="button" class="btn btn-default btn-md" title="Send invitation">
                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                </button>

                <button type="button" class="btn btn-default btn-md">
                    <span class="glyphicon glyphicon-link" aria-hidden="true"></span>
                </button>

                <button type="button" class="btn btn-default btn-md">
                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                </button>

                <img src="${resource(dir: "images",file: "person-icon.png")}" height="35px" width="35px"/>

                                <span class="dropdown">
                    <select name="myList" >
                        <option value="username" disabled="disabled" selected="selected">${params.username}</option>
                        <option value="action">Profile</option>
                        <option value="action2">Users</option>
                        <option value="action3">Topics</option>

                        <option value="action4">Posts</option>
                        <g:link controller="login" action="logout">
                        <option value="action5">Logout</option></g:link>
                    </select>
                </span>
            </form>
        </div><!-- search ends-->
    </div><!-- /.container-fluid -->
</nav><!-- navbar ends -->

<g:layoutBody/>
</body>
</html>