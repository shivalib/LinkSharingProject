<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 7/3/15
  Time: 10:59 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <title><g:layoutTitle default="User Profile"/></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


    <!-- jquery-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

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
            %{--</div>--}%

            %{--<div>--}%
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.message}
            </div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">×</button>
                ${flash.error}
            </div>
        </g:if>

    <!--Search-->
        <div>
            <form class="navbar-form navbar-right " role="search">${params.username}
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>


                <img src="${resource(dir: "images",file: "person-icon.png")}" height="35px" width="35px"/>

                <span class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                        ${loginUser.fullName}
                        <span class="caret"/>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation">
                            <g:link role="menuitem" tabindex="-1" controller="userProfile" action="index">Profile</g:link></li>
                        <li class="divider"></li>

                        <li role="presentation">
                            <g:link role="menuitem" tabindex="-1" controller="login" action="logout">Logout</g:link></li>
                        %{--<a role="menuitem" tabindex="-1" href="#">Logout</a></li>--}%
                    </ul>
                </span>

            </form>
        </div><!-- search ends-->
    </div><!-- /.container-fluid -->
</nav><!-- navbar ends -->

<g:layoutBody/>
</body>
</html>