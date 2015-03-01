<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 1/3/15
  Time: 4:24 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div class="row">
    <div class="col-md-4">

        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Topic : topicname</h3>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir: "images", file:"person-icon.png")}">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="#">topicname</a>Private/Public</h4>
                        <div>
                            <h5>@username</h5>
                            <span class="right">Posts</span>
                            <span class="right rightdiv">Subscriptions</span>
                            <span class="left"><a href="#">Subscribe</a></span>
                        </div>
                        <div>
                            <span class="right">
                                <select name="SeriousnessList">
                                    <option name="serious">Serious</option>
                                    <option name="verySerious">Very Serious</option>
                                    <option name="casual">Casual</option>
                                </select>
                                <button type="button" class="btn btn-default" title="Send invitation">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!--panel body ends-->
        </div><!-- panel ends-->

        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Users : topicname</h3>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir: "images", file:"person-icon.png")}">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Complete Name</h4>
                        <div>
                            <h5>@username</h5>
                                <span class="leftdiv">Topics</span>
                                <span class="leftdiv">Subscriptions</span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!--panel body ends-->
        </div><!-- panel ends-->
    </div><!--col md-4 ends-->
    <div class="col-md-8">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title " >Posts : topicName</h3></span>
                <span>
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                    </form>
                </span>
            </div>

        <div class="panel-body">
            <div class="media ">
                <div class="media-left">
                    <a href="#">
                        <g:img class="media-object mediaFace" dir="images" file="person-icon.png" alt="Person"></g:img>
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
                        <g:img class="media-object mediaFace" dir="images" file="person-icon.png" alt="Person"></g:img>
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
<head>
    <title></title>
    <meta name="layout" content="topicShowLayout">
</head>

</html>