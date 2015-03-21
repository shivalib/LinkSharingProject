
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

                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-link" aria-hidden="true"/>
                </button>

                <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myDocumentModal">
                    <span class="glyphicon glyphicon-file" aria-hidden="true"/>
                </button>

                <g:link controller="userProfile" action="showUserPublicProfile">
                    <img src="${resource(dir: "images", file: "person-icon.png")}" title="User Profile" height="35px"
                         width="35px"/>
                </g:link>

                <ls:showHeader currentUser="${loginUser}"/>

            </form>
        </div><!-- search ends-->
    </div><!-- /.container-fluid -->
</nav><!-- navbar ends -->

<g:layoutBody/>

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
                        <g:select name="topicList" from="${resource.}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="submit" class="btn btn-default" value="Share"/>
                        <g:submitButton name="cancel" class="btn btn-default" data-dismiss="modal"
                                        value="Cancel"/>

                    </div>
                </g:form>
            </div>
            %{--<div class="modal-footer">--}%
            %{--<g:submitButton type="button" class="btn btn-primary" name="submit" >Save </g:submitButton>--}%
            %{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
            %{--</div>--}%
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
                        %{--<g:textField name="docName" placeholder="Document"/>--}%
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
                        <g:submitButton name="share" value="Share" class="btn btn-default"/>
                        <g:submitButton name="reset" value="Cancel" class="btn btn-default"
                                        data-dismiss="modal"/>
                    </div>
                </g:form>
            </div>
            %{--<div class="modal-footer">--}%
            %{--<g:submitButton type="button" class="btn btn-primary" name="submit" >Save </g:submitButton>--}%
            %{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
            %{--</div>--}%
        </div>
    </div>
</div>
</body>
</html>