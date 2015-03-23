<%@ page import="com.ig.LinkShare.applicationEnums.Visibility; com.ig.LinkShare.applicationEnums.Seriousness" %>
%{--todo move this template to its respective folder--}%


<div class="media ">
    <div class="media-left">
        <a href="#">
            <img src="${createLink(controller: "image", action: "renderImage", params: [path: loginUser.photoPath])}"
                 class="media-object mediaFace">
        </a>
    </div>

    <div class="media-body">
        <h4 class="media-heading">
            <h5>${topics.topicName}</h5>

        </h4>

        <div>
            <h5>@${loginUser.username}</h5>
        </div>
        <span class="right">Posts
            <div>${topics.resources.size()}</div>
        </span>

        <span class="right rightdiv">Subscriptions
            <div>${topics.subscriptions.size()}</div>
        </span>
        %{--<div>--}%
        <br><br>
        <span>
            <g:select name="seriousness" from="${com.ig.LinkShare.applicationEnums.Seriousness}"/>
            <g:select name="visibility" from="${com.ig.LinkShare.applicationEnums.Visibility}"/>

            <button type="button" class="btn btn-default" title="Send invitation" data-toggle="modal"
                    data-target="#mySendInviteModal">
                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
            </button>

            <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal"
                    data-target="#myEditModal-${topics.id}">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </button>

            <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#myEditModal-${topics.topicName}">
                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
            </button>

        </span>

        %{--</div>--}%
    </div><!--media body ends-->
</div><!--media ends -->

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
                <g:form class="loginform" controller="lsMail" action="sendInvite">
                    <div>
                        <span>Email* :</span>
                        <g:textField name="emailID"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <g:select name="topicList" from="${topicList.topicName}"/>
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

<!-- Modal:edit -->
<div class="modal fade" id="myEditModal-${topics.topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalEdit">Edit Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="updateTopic" id="${topics.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topics.topicName}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" class="btn btn-default" data-dismiss="modal" value="Close"/>
                    </div>
                </g:form>
            </div>
            %{--<div class="modal-footer">--}%
            %{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
            %{--<button type="button" class="btn btn-primary">Save changes</button>--}%
            %{--</div>--}%
        </div>
    </div>
</div>

<!-- Modal:trash -->
<div class="modal fade" id="myEditModal-${topics.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalTrash">Delete Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="deleteTopic" id="${topics.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topics.topicName}"/>
                    </div>
                    <br>

                    <div>
                        <span>Are you sure you want to delete this topic?</span>
                    </div>

                    <div class="right">
                        <g:submitButton name="save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" class="btn btn-default" data-dismiss="modal" value="Close"/>
                    </div>
                </g:form>
            </div>

            %{--<div class="modal-footer">--}%
            %{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
            %{--<button type="button" class="btn btn-primary">Save changes</button>--}%
            %{--</div>--}%
        </div>
    </div>
</div>
