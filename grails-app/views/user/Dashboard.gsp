<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 9:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>

    <meta name="layout" content="dashboardLayout">

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
            %{--<form class="navbar-form navbar-right " role="search">${params.username}--}%
                %{--<div class="form-group">--}%
                    %{--<input type="text" class="form-control" placeholder="Search">--}%
                %{--</div>--}%

                %{--<button type="button" class="btn btn-default btn-md" title="Create topic">--}%
                    %{--<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>--}%
                %{--</button>--}%

                %{--<button type="button" class="btn btn-default btn-md" title="Send invitation">--}%
                    %{--<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>--}%
                %{--</button>--}%

                %{--<button type="button" class="btn btn-default btn-md">--}%
                    %{--<span class="glyphicon glyphicon-link" aria-hidden="true"></span>--}%
                %{--</button>--}%

                %{--<button type="button" class="btn btn-default btn-md">--}%
                    %{--<span class="glyphicon glyphicon-file" aria-hidden="true"></span>--}%
                %{--</button>--}%

                %{--<img src="${resource(dir: "images",file: "person-icon.png")}" height="35px" width="35px"/>--}%
                %{--<span class="dropdown">--}%
                    %{--<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">--}%
                        %{--Dropdown--}%
                        %{--<span class="caret"></span>--}%
                    %{--</button>--}%

                    %{--<select name="myList" >--}%
                        %{--<option value="username" disabled="disabled" selected="selected">${params.username}</option>--}%
                        %{--<option value="action">Action</option>--}%
                        %{--<option value="action2">Action2</option>--}%
                        %{--<option value="action3">Action3</option>--}%
                        %{--<option value="action4">Action4</option>--}%
                    %{--</select>--}%
                    %{--<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">--}%
                        %{--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>--}%
                        %{--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>--}%
                        %{--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>--}%
                        %{--<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>--}%
                    %{--</ul>--}%
                %{--</span>--}%
            %{--</form>--}%
        %{--</div><!-- search ends-->--}%
    %{--</div><!-- /.container-fluid -->--}%
%{--</nav><!-- navbar ends -->--}%

<div class="row">
    <div class="col-md-4">
        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Shivali Batra</h4>
                        This is a sample text to be replaced by the data
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!-- panel body ends-->
        </div><!--panel ends-->

    <!--Subscriptions-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title " >Subscriptions</h3></span>
                <span class="right"><a href="">View All</a></span>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
                        This is a sample text to be replaced by the data
                    </div><!--media body ends-->
                </div><!-- media ends-->
            </div><!-- panel body ends-->

            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
                        This is a sample text to be replaced by the data
                    </div><!--media body ends-->
                </div><!--media ends-->
            </div><!--panel body ends-->
        </div><!--panel ends -->

    <!-- Send Invitation -->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Send invitation (Pop up)</h3>
            </div>
            <div class="panel-body">
                <form class=loginform>
                    <div>
                        <span>Email* : </span>
                        <input type="text"></input>
                    </div>
                    <div>
                        <span>Topic* : </span>
                        <select name="topics">
                            <option>Topic 1
                            <option>Topic 2
                            <option>Topic 3
                            <option>Topic 4
                        </select>
                    </div>
                    <div class="right">
                        <input type="submit" value="Invite"/>
                        <input type="reset" value="Cancel" />
                    </div>
                </form>
            </div><!-- panel body ends -->
        </div><!--Panel ends-->
    </div><!-- col-md-4 -->
    <div class="col-md-8">
        <!--INBOX-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title " >Inbox</h3></span>
                <span class="right"><a href="">View All</a></span>
            </div>

            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
                        This is a sample text to be replaced by the data
                    </div><!--media body ends-->

                    <div class="right">
                        <a href="">Download</a>
                        <a href="">View full site</a>
                        <a href="">Mark as read</a>
                        <a href="">View post</a>
                    </div>
                </div>
            </div><!--panel body ends-->

            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
                        This is a sample text to be replaced by the data
                    </div><!--media body ends-->
                    <div class="right">
                        <a href="">Download</a>
                        <a href="">View full site</a>
                        <a href="">Mark as read</a>
                        <a href="">View post</a>
                    </div>
                </div>
            </div><!--panel body ends-->
        </div>
    </div>
</div>

</body>
</html>