<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 6:13 PM
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

    <!-- jquery-->
    <script src="${resource(dir: "js",file: "jquery.min.js")}"></script>

    <!-- Self-created CSS -->
    <link rel="stylesheet" href="${resource(dir: "css", file: "LinkShare.css")}">

    <g:layoutHead/>
</head>

<body>

<!--Navigation Bar-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Link Sharing</a>
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
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            </form>
        </div><!-- /.navbar-collapse -->

    </div><!-- /.container-fluid -->
</nav>

<g:layoutBody/>
</body>
</html>