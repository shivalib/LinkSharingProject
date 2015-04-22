<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle/></title>

    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap-theme.min.css"/>
    <asset:stylesheet src="LinkShare.css"/>
    %{--<asset:javascript src="jquery.min.js"/>--}%
    <asset:javascript src="jquery-2.1.3.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="jquery.validate.min(1).js"/>
    <asset:javascript src="dashboard.js"/>
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
            <g:form controller="search" action="searchPage" class="navbar-form navbar-right " role="search">
                <div class="form-group">
                    <input type="text" name="searchGlobal" class="searchGlobal" class="form-control"
                           placeholder="Search"/>
                </div>
                <sec:ifLoggedIn>
                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal"
                            data-target="#myCreateTopicModal" title="Create Topic">
                        <span class="glyphicon glyphicon-comment" aria-hidden="true"/>
                    </button>

                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal"
                            data-target="#mySendInviteModal" title="Send Invite">
                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"/>
                    </button>

                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal"
                            title="Create Link">
                        <span class="glyphicon glyphicon-link" aria-hidden="true"/>
                    </button>

                    <button type="button" class="btn btn-default btn-lg" data-toggle="modal"
                            data-target="#myDocumentModal" title="Upload Document">
                        <span class="glyphicon glyphicon-file" aria-hidden="true"/>
                    </button>

                    <g:link controller="userProfile">
                        <img src="${resource(dir: "images", file: "person-icon.png")}" title="User Profile"
                             height="35px" width="35px"/>

                    </g:link>

                    <sec:ifAllGranted roles="ROLE_USER">
                        <g:render template="/dashboard/headerForUser"/>
                    </sec:ifAllGranted>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:render template="/dashboard/headerForAdmin"/>
                    </sec:ifAllGranted>

                </sec:ifLoggedIn>
            </g:form>
        </div><!-- search ends-->
    </div><!-- /.container-fluid -->
</nav><!-- navbar ends -->

<g:layoutBody/>

<!-- Modal : SEND iNVIATION -->
<div class="modal fade" id="mySendInviteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="mySendInviteModelLabel">Send Invitation</h4>
            </div>

            <div class="modal-body">
                <g:form class="loginform" controller="lsMail" action="sendInviteFromList">
                    <div>
                        <span>Email* :</span>
                        <g:textField name="emailID"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <g:select name="topicList" from="${topicList}"/>
                        <g:link controller="topic" action="createTopic" data-toggle="modal"
                                data-target="#myCreateTopicModal" title="Create Topic">Create New Topic</g:link>
                    </div>

                    <div class="right">
                        <g:submitButton name="invite" class="btn btn-primary" value="Invite"/>
                        <g:submitButton name="reset" class="btn btn-primary" data-dismiss="modal"
                                        value="Cancel"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<!-- Modal : Share Link -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Share Link</h4>
            </div>

            <div class="modal-body">
                <g:form class="loginform" method="post" controller="linkResource" action="shareLink">
                    <div>
                        <span>Link* :</span>
                        <g:textField name="link"/>
                    </div>

                    <div>
                        <span>Description* :</span>
                        <g:textArea name="desc" rows="5" cols="40"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <g:select name="topicList" from="${topicList}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="submit" class="btn btn-primary" value="Share"/>
                        <g:submitButton name="cancel" class="btn btn-primary" data-dismiss="modal"
                                        value="Cancel"/>

                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<!-- Modal : Share Document -->
<div class="modal fade" id="myDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="shareDocModel">Share Document</h4>
            </div>

            <div class="modal-body">
                <g:form class="loginform" method="post" controller="documentResource" action="shareDocument"
                        enctype="multipart/form-data">
                    <div>
                        <span>Document* :</span>
                        <span><input type="file" name="docFile"></span>
                    </div>

                    <div>
                        <span>Description* :</span>
                        <g:textArea name="description" rows="5" cols="40" placeholder="Description"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <g:select name="topic" from="${topicList}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="share" value="Share" class="btn btn-primary"/>
                        <g:submitButton name="reset" value="Cancel" class="btn btn-primary"
                                        data-dismiss="modal"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

%{--<!-- Modal : Create Topic -->--}%
<div class="modal fade" id="myCreateTopicModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myTopicModalLabel">Create Topic</h4>
            </div>

            <div class="modal-body">
                <g:form class="loginform" name="createTopicForm" controller="topic" action="createTopic">
                    <div>
                        <span>Name* :</span>
                        <g:textField name="topicName"
                                     data-checkTopic="${createLink(controller: "topic", action: "validateTopicName")}"/>
                    </div>

                    <div>
                        <span>Visibility* :</span>
                        <g:select name="topicType" from="${com.ig.LinkShare.applicationEnums.Visibility}"/>
                    </div>

                    <div class="right">
                        <g:submitButton class="btn btn-primary" name="save" value="Save"/>
                        <g:submitButton name="cancel" value="Cancel" class="btn btn-primary"
                                        data-dismiss="modal"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>