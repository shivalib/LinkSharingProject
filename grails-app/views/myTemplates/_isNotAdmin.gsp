<%@ page import="com.ig.LinkShare.applicationEnums.Seriousness" %>
%{--todo move this template to its respective folder--}%


<div class="left leftdiv">
    <g:select name="seriousness" from="${com.ig.LinkShare.applicationEnums.Seriousness}" value="${subscription}" />

    <button type="button" class="btn btn-default" title="Send invitation" data-toggle="modal"
            data-target="#mySendInviteModal">
        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>

    </button>
</div>

