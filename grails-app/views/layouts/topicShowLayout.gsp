<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 1/3/15
  Time: 4:26 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
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
    <g:layoutHead/>

</head>
<body>
<!--Navigation Bar-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
           <g:link class="navbar-brand" controller="home" action="dashboard">Link Sharing</g:link>
        </div>

        <!--Search-->
        <div>
            <form class="navbar-form navbar-right " role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>

                <button type="button" class="btn btn-default btn-md">
                    <span class="glyphicon glyphicon-link" aria-hidden="true"></span>
                </button>

                <button type="button" class="btn btn-default btn-md">
                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                </button>

                <img src="${resource(dir: "images",file: "person-icon.png")}" height="35px" width="35px"/>
                <span class="dropdown">
                    <select name="myList" >
                        <option value="username" disabled="disabled" selected="selected"></option>
                        <option value="action">Profile</option>
                        <option value="action2">Logout</option>
                    </select>
                </span>
            </form>
        </div><!-- search ends-->
    </div><!-- /.container-fluid -->
</nav><!-- navbar ends -->

<g:layoutBody/>
</body>
</html>