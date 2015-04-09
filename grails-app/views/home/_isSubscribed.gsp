<%@ page import="com.ig.LinkShare.applicationEnums.Seriousness" %>
<div>

    <span class="right">
        <g:select name="seriousness" class="subscribeSeriousness"
                  from="${com.ig.LinkShare.applicationEnums.Seriousness}"
                  value="${subscription.seriousness}" id="${subscription.id}"
                  data-changeSerious="${createLink(controller: "subscription", action: "changeSeriousness")}"/>

        <button type="button" class="btn btn-default btn-md" data-toggle="modal"
                data-target="#mySendInviteModal-${subscription.id}">
            <span class="glyphicon glyphicon-envelope" aria-hidden="true"/>
        </button>

    </span>
</div>

<!-- Modal : SEND iNVIATION -->
<div class="modal fade" id="mySendInviteModal-${subscription.id}" tabindex="-1" role="dialog"
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
                <g:form class="loginform" controller="lsMail" action="sendInvite" id="${subscription.topic.id}">
                    <div>
                        <span>Email* :</span>
                        <g:textField name="emailID"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <label for="${subscription.id}">${subscription.topic.topicName}</label>

                        %{--<g:textField name="topicList" value="${subscription.topic.topicName}" readonly="true"/>--}%
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

<!-- Modal -->
<div class="modal fade" id="myModal--${topic.topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Topic Seriousness</h4>
            </div>

            <div class="modal-body">
                <g:form class="loginform" name="loginForm" controller="subscription" action="subscribeUser">
                    <div>
                        <span>Topic :</span>
                        <g:textField name="topicName" value="${topic.topicName}"/>
                    </div>

                    <div>
                        <span>Seriousness* :</span>
                        <g:select name="seriousness" from="${Seriousness}"/>
                    </div>

                    <div>
                        <g:submitButton name="Save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" value="Close" class="btn btn-default"
                                        data-dismiss="modal"></g:submitButton>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
