<%@ page import="com.ig.LinkShare.applicationEnums.Seriousness" %>
%{--todo move this template to its respective folder--}%


<div class="left leftdiv seriousnessDiv">
    <g:select name="seriousness" class="subscribeSeriousness" from="${com.ig.LinkShare.applicationEnums.Seriousness}"
              value="${subscription.seriousness}" id="${subscription.id}"
              data-changeSerious="${createLink(controller: "subscription", action: "changeSeriousness")}"/>

    <button type="button" class="btn btn-default" title="Send invitaion" data-toggle="modal"
            data-target="#mySendInviteModal-${subscription.id}">
        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
    </button>
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
                <g:form class="loginform" controller="lsMail" action="sendInvite">
                    <div>
                        <span>Email* :</span>
                        <g:textField name="emailID"/>
                    </div>

                    <div>
                        <span>Topic* :</span>
                        <g:textField name="topicList" value="${subscription.topic.topicName}"/>
                        %{--<g:select name="topicList" from="${subscription.topic.topicName}"/>--}%
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
