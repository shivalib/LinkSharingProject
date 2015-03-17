

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
    <link rel="stylesheet" href="${resource(dir: "css", file: "LinkShare.css")}">
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

                <img src="${resource(dir: "images", file: "person-icon.png")}" height="35px" width="35px"/>

                <span class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-expanded="true">
                        ${loginUser.fullName}
                        <span class="caret"/>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation">
                            <g:link role="menuitem" tabindex="-1" controller="userProfile"
                                    action="index">Profile</g:link></li>
                        <li class="divider"></li>

                        <li role="presentation">
                            <g:link role="menuitem" tabindex="-1" controller="login"
                                    action="logout">Logout</g:link></li>
                    </ul>
                </span>
            </form>
        </div><!-- search ends-->
    </div><!-- /.container-fluid -->
</nav><!-- navbar ends -->

<g:layoutBody/>
</body>
</html>