
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
    <asset:javascript src="jquery.validate.min(1).js"/>
    <asset:javascript src="homePage.js"/>
    <g:layoutHead/>
</head>

<body>

<!--Navigation Bar-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <g:link class="navbar-brand" controller="home" action="index">Link Sharing</g:link>
            %{--<a class="navbar-brand" href="#">Link Sharing</a>--}%
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