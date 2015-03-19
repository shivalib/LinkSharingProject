
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Login Layout"/></title>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.min.css"/>
    <asset:stylesheet src="LinkShare.css"/>
    %{--<asset:javascript src="jquery.min.js"/>--}%
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    %{--<asset:javascript src="dashboard.js"/>--}%

    %{--<asset:javascript src="jquery-ui.js"/>--}%

    %{--<asset:stylesheet src="jquery-ui.css"/>--}%

    %{--<asset:stylesheet src="jquery-ui.theme.css"/>--}%

    <!-- Latest compiled and minified JavaScript -->
    %{--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>--}%

</head>
<g:layoutHead/>
<body>
<!--Navigation Bar-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <g:link class="navbar-brand" controller="home" action="dashboard">Link Sharing</g:link>
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

                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myCreateTopicModal">
                    <span class="glyphicon glyphicon-comment" aria-hidden="true"/>
                </button>

                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#mySendInviteModal">
                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"/>
                </button>


                %{--<button type="button" class="btn btn-primary btn-lg" id="emailButton">--}%
                    %{--<span class="glyphicon glyphicon-envelope" aria-hidden="true"/>--}%
                %{--</button>--}%

                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-link" aria-hidden="true"/>
                </button>

                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myDocumentModal">
                    <span class="glyphicon glyphicon-file" aria-hidden="true"/>
                </button>

                <img src="${resource(dir: "images",file: "person-icon.png")}" height="35px" width="35px"/>

                <span class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                        ${loginUser.fullName}
                        <span class="caret"/>
                    </button>
                    <ul class="dropdown-menu mydropdown" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation">
                        <g:link role="menuitem" tabindex="-1" controller="userProfile" action="index">Profile</g:link></li>

                        <li class="divider"></li>

                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Users</a></li>
                        <li class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Topics</a></li>
                        <li class="divider"></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Posts</a></li>

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