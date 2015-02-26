<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 12:48 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="loginLayout">
    %{--<!-- Latest compiled and minified CSS -->--}%
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">--}%

    %{--<!-- Optional theme -->--}%
    %{--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">--}%

    %{--<!-- Latest compiled and minified JavaScript -->--}%
    %{--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>--}%

    %{--<!-- Self-created CSS -->--}%
    %{--<link rel="stylesheet" href="${resource(dir: "css",file:"LinkShare.css" )}">--}%

</head>
<body>
%{--<!--Navigation Bar-->--}%
%{--<nav class="navbar navbar-default">--}%
    %{--<div class="container-fluid">--}%
        %{--<div class="navbar-header">--}%
            %{--<a class="navbar-brand" href="#">Link Sharing</a>--}%
        %{--</div>--}%

        %{--<!--Search-->--}%
        %{--<div>--}%
            %{--<form class="navbar-form navbar-right" role="search">--}%
                %{--<div class="form-group">--}%
                    %{--<input type="text" class="form-control" placeholder="Search">--}%
                %{--</div>--}%
            %{--</form>--}%
        %{--</div><!-- /.navbar-collapse -->--}%
    %{--</div><!-- /.container-fluid -->--}%
%{--</nav>--}%

<div class="row">
    <div class="col-md-8">

        <!--Recent Shares-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading" >
                <h1 class="panel-title">Recent shares</h1>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir: "images",file:"person-icon.png")}" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Shivali Batra</h4>
                        This is a sample text to be replaced by the comments
                    </div>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file:"facebook.png" )}" class="icon"/></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file: "twitter-icon.png")}" class="icon"/></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file: "icon_google_plus.png")}" class="icon" /></span>
                    </button>
                    <span><a href="" class="right">View post</a></span>

                </div>
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir:"images",file: "person-icon.png")}" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Shivali Batra</h4>
                        This is a sample text to be replaced by the comments
                    </div>

                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file:"facebook.png" )}" class="icon"/></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file: "twitter-icon.png")}" class="icon"/></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file: "icon_google_plus.png")}" class="icon" /></span>
                    </button>

                    <span><a href="" class="right">View post</a></span>
                </div>
            </div><!--panel body end -->
        </div><!--panel end-->

        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Top Posts</h3>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir: "images",file: "person-icon.png")}" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Shivali Batra</h4>
                        This is a sample text to be replaced by the comments
                    </div>

                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file:"facebook.png" )}" class="icon"/></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file: "twitter-icon.png")}" class="icon"/></span>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                        <span><img src="${resource(dir: "images",file: "icon_google_plus.png")}" class="icon" /></span>
                    </button>

                    <span><a href="" class="right">View post</a></span>
                </div>
            </div>
        </div>
    </div><!--col 8 end-->
    <div class="col-md-4">
        <!--LOGIN FORM-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Login</h3>
            </div>
            <div class="panel-body">
                <g:form class="loginform" controller="login" action="loginHandler"  >
                    <div>
                        <span>Email/Username*</span>
                        <input type="text" name="username"/>
                    </div>
                    <div>
                        <span>Password*</span>
                        <input type="password" name="password"/>
                    </div>
                    <div>
                        <a href="" class =left>Forgot Password</a>
                        <input type="submit" value="Login" class="right"/>
                    </div>
                </g:form>
            </div>
        </div><!--login form ends -->
<!--REGISTERATION FORM-->
    <div class="panel panel-default rightdiv">
        <div class="panel-heading">
            <h3 class="panel-title">Register</h3>
        </div>
        <div class="panel-body">
            <g:form class="loginform" controller="login" action="registerUser">
                <div>
                    <span>First name*</span>
                    <g:textField name="firstName"></g:textField>
                </div>

                <div>
                    <span>Last name*</span>
                    <g:textField name="lastName"></g:textField>
                </div>

                <div>
                    <span>Email*</span>
                    <g:textField name="email"></g:textField>
                </div>

                <div>
                    <span>Username*</span>
                    <g:textField name="username"></g:textField>
                </div>

                <div>
                    <span>Password*</span>
                    <g:passwordField name="password"></g:passwordField>
                </div>

                <div>
                    <span>Confirm Password*</span>
                    <g:passwordField name="cofirmPassword"></g:passwordField>
                </div>

                <div>
                    <span>Photo</span>
                    <input id="uploadFile" placeholder="Choose File" disabled="disabled" class="browsebar" />
                    <input type="file" name="img" class="btn-default">
                </div>
                <div>
                    <g:submitButton name="submit" value="Register"/>
                </div>
            </g:form>

        </div>
    </div><!--registeration form ends-->
</div><!-- col 4 end-->
</div><!--Ending div -->

</body>
</html>