<%@ page import="com.ig.LinkShare.applicationEnums.Seriousness" %>
%{--todo move this template to its respective folder--}%


<div class="left leftdiv seriousnessDiv">
    <g:select name="seriousness" class="subscribeSeriousness" from="${com.ig.LinkShare.applicationEnums.Seriousness}"
              value="${subscription.seriousness}" id="${subscription.id}"
              data-changeSerious="${createLink(controller: "subscription",action: "changeSeriousness")}" />

    <button type="button" class="btn btn-default" title="Send invitaion" data-toggle="modal"
            data-target="#mySendInviteModal">
        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
    </button>
</div>

