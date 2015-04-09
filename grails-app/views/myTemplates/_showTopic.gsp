<%@ page import="com.ig.LinkShare.applicationEnums.Visibility; com.ig.LinkShare.applicationEnums.Seriousness" %>
<div class="media ">
    <div class="media-left">
        <ls:userPhoto currentUser="${topics.topic.createdBy}"/>
    </div>

    <div class="media-body">
        <h4 class="media-heading">

            <h5>${topics.topic.topicName}</h5>

        </h4>

        <div>
            <h5>@${topics.topic.createdBy.username}</h5>
        </div>
        <span class="right">Posts
            <div>${topics.topic.resources.size()}</div>
        </span>

        <span class="right rightdiv">Subscriptions
            <div>${topics.topic.subscriptions.size()}</div>
        </span>
        <div>
        <br><br>
        <span>

            <g:select name="seriousness" class="subscribeSeriousness"
                      from="${com.ig.LinkShare.applicationEnums.Seriousness}"
                      value="${topics.seriousness}" id="${topics.id}"
                      data-changeSerious="${createLink(controller: "subscription", action: "changeSeriousness")}"/>

            <g:select name="visibility" class="topicVisibility" from="${com.ig.LinkShare.applicationEnums.Visibility}"
                      value="${topics.topic.visibility}"
                      data-changeVisibility="${createLink(controller: "subscription", action: "changeVisibility")}"
                      data-topic-id="${topics.topic.id}"/>

            <button type="button" class="btn btn-default" title="Send invitation" data-toggle="modal"
                    data-target="#mySendInviteModal-${topics.topic.topicName}">
                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
            </button>

            <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal"
                    data-target="#myEditModal-${topics.topic.id}">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </button>

            <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal"
                    data-target="#myEditModal-${topics.topic.topicName}">
                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
            </button>

        </span>

        </div>
    </div><!--media body ends-->
</div><!--media ends -->

<!-- Modal : SEND iNVIATION -->
<div class="modal fade" id="mySendInviteModal-${topics.topic.topicName}" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="mySendInviteModelLabel">Send Invitation</h4>
            </div>

            <div class="modal-body">
                <g:form class="loginform" controller="lsMail" action="sendInvite" id="${topics.topic.id}">
                    <div>
                        <span>Email* :</span>
                        <g:textField name="emailID"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <label for="${topics.topic.id}">${topics.topic.topicName}</label>

                        %{--<g:textField name="topicList" value="${topics.topic.topicName}" readonly="trues"/>--}%
                    </div>

                    <div class="right">
                        <g:submitButton name="invite" class="btn btn-default" value="Invite"/>
                        <g:submitButton name="reset" class="btn btn-default" data-dismiss="modal"
                                        value="Cancel"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<!-- Modal:edit -->
<div class="modal fade" id="myEditModal-${topics.topic.topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalEdit">Edit Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="updateTopic" id="${topics.topic.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topics.topic.topicName}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" class="btn btn-default" data-dismiss="modal" value="Close"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<!-- Modal:trash -->
<div class="modal fade" id="myEditModal-${topics.topic.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalTrash">Delete Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="deleteTopic" id="${topics.topic.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topics.topic.topicName}"/>
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
        </div>
    </div>
</div>
