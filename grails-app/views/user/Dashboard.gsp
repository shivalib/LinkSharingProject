

%{--todo rename the file properly--}%
%{--todo move this file to its respective folder--}%

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout">
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                %{--<g:each in="${currentUser}" var="usr">--}%
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <g:img class="media-object mediaFace" dir="images" file="person-icon.png"
                                   alt="Person"></g:img>
                        </a>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">
                            ${loginUser.fullName}
                        </h4>

                        <div>
                            <h5>@${loginUser.username}</h5>
                        </div>

                        <div>
                            <span class="left leftdiv">Subscriptions
                                <div>${loginUser.subscriptions.size()}</div>
                            </span>
                            <span class="left leftdiv">Topics
                                <div>${loginUser.topics.size()}</div>
                            </span>
                        </div>

                        <div>
                            <span class="left leftdiv"></span>
                            <span class="left leftdiv"></span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!-- panel body ends-->
        </div><!--panel ends-->

    <!--Subscriptions-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Subscriptions
                    <span class="right">
                        <g:link>View all</g:link>
                    </span>
                </h3></span>
            </div>
            <g:each in="${subscriptionList}" var="subscription">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <g:img class="media-object mediaFace" dir="images" file="person-icon.png"
                                       alt="Person"></g:img>
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading">
                                <g:link controller="topic" action="index" id="${subscription.topic.id}" params="[loginUser:loginUser.id]">${subscription.topic.topicName}</g:link>
                            </h4>

                            <div>
                                @${subscription.user.username}
                                <span class="right">Posts
                                    <div>${subscription.topic.resources.size()}</div>
                                </span>
                                <span class="right rightdiv">Subscriptions
                                    <div>${subscription.topic.subscriptions.size()}</div>
                                </span>
                            </div>
                            <br><br><br>

                            <div>
                                <ls:isEditable currentUser="${loginUser}"
                                               topicCreater="${subscription.topic.createdBy}"/>
                            </div>
                        </div><!--media body ends-->
                    </div><!-- media ends-->
                </div><!-- panel body ends-->
            </g:each>
        </div><!--panel ends -->

    <!--Trending topic-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topic</h3>
            </div>
            <g:each in="${trendingTopicList}" var="trending">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object mediaFace"
                                     src="${resource(dir: "images", file: "person-icon.png")}">
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading">
                                <g:link controller="topic" action="index" id="${trending.id}" params="[loginUser:loginUser.id]">${trending.topicName}</g:link>
                            </h4>

                            <div>
                                <div>
                                    @${trending.createdBy.username}
                                    <span class="right">Posts
                                        <div>${trending.resources.size()}</div>
                                    </span>
                                    <span class="right rightdiv">Subscriptions
                                        <div>${trending.subscriptions.size()}</div>
                                    </span>
                                </div><br>
                            </div>

                            <div>
                                <ls:isSubscribed currentUser="${loginUser}" topicID="${trending}"/>

                                <ls:isNotSubscribed currentUser="${loginUser}" topicID="${trending}"
                                                    topicName="${trending.topicName}"/>
                            </div>
                        </div><!--media body ends-->
                    </div><!--media ends -->
                </div><!--panel body ends-->
            </g:each>
        </div><!-- panel ends-->

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
                        <g:form class="loginform">
                            <div>
                                <span>Email* :</span>
                                <g:textField name="email"/>
                            </div>

                            <div>
                                <span>Topic* :</span>
                                <g:select name="topicList" from="${topicList}"></g:select>
                            </div>

                            <div class="right">
                                <g:submitButton name="invite" class="btn btn-default" value="Invite"/>
                                <g:submitButton name="reset" class="btn btn-default" data-dismiss="modal"
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
    </div><!-- col-md-4 -->
    <div class="col-md-7">
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
                                <input type="submit" value="Share"/>
                                <input type="reset" value="Cancel"/>
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
                        <g:form class="loginform" method="post" controller="documentResource" action="shareDocument">
                            <div>
                                <span>Document* :</span>
                                <g:textField name="docName" placeholder="Document"/>
                                <span><input type="file" name="docFile"></span>
                            </div>

                            <div>
                                <span>Description* :</span>
                                <g:textArea name="desc" rows="5" cols="40" placeholder="Description"/>
                            </div>

                            <div>
                                <span>Topic* :</span>
                                <g:select name="topicList" from="${topicList}"/>
                            </div>

                            <div class="right">
                                <g:submitButton name="share" value="Share"/>
                                <g:submitButton name="reset" value="Cancel"/>
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
        <!-- Modal : Create Topic -->
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
                        <g:form class="loginform" controller="topic" action="createTopic">
                            <div>
                                <span>Name* :</span>
                                <g:textField name="topicName"/>
                            </div>

                            <div>
                                <span>Visibility* :</span>
                                <g:select name="topicType" from="${LinkShareEnums.Visibility}"/>
                            </div>

                            <div class="right">
                                <g:submitButton class="btn btn-primary" name="save" value="Save"/>
                                <g:submitButton name="cancel" value="Cancel" class="btn btn-default"
                                                data-dismiss="modal"/>
                            </div>
                        </g:form>
                    </div>
                    %{--<div class="modal-footer">--}%
                    %{--<g:submitButton type="button" class="btn btn-primary" name="save" value="Save"/>--}%
                    %{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
                    %{--<g:submitButton name="cancel" value="Cancel" class="btn btn-default" data-dismiss="modal"/>--}%
                    %{--</div>--}%
                </div>
            </div>
        </div>
        <g:form controller="user" action="list">
            <g:actionSubmit value="submit"/>
        </g:form>

        <!--INBOX-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Inbox
                    <span class="right">
                        <g:link>View all</g:link>
                    </span>
                </h3></span>
            </div>
            <g:each in="${readingItemListWithIsReadFalse}" var="unreadItem">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object mediaFace"
                                     src="${resource(dir: "images", file: "person-icon.png")}">
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading"></h4>

                            <div>
                                ${unreadItem.resource.topic.createdBy.fullName}@ ${unreadItem.resource.topic.createdBy.username}
                            </div>

                            <div>
                                ${unreadItem.resource.description}
                            </div>
                        </div><!--media body ends-->

                        <div class="right leftdiv">
                            <g:link>View Post</g:link>
                        </div>
                        <ls:checkResourceType resource="${unreadItem.resource}"/>
                        <ls:markResource resource="${unreadItem.resource}" currentUser="${loginUser}"/>

                    </div>
                </div><!--panel body ends-->
            </g:each>
        </div><!--panel ends-->
    <g:form controller="myMail" action="testAction">
        <g:submitButton name="submit" value="Test Mail"/>
    </g:form>
    %{--<ls:isEditable happy="true">hello</ls:isEditable>--}%
    </div>
</div>
</body>
</html>