%{--todo move this template to its respective folder--}%

<div>
    <span class="left">
        <g:link controller="subscription" id="Link--${topicName}" action="subscribeUser" data-toggle="modal" data-target="#myModal--${topicName}">Unsubscribe</g:link>
    </span>
    <span class="right">
        <g:select name="seriousness" from="${LinkShareEnums.Seriousness}"/>
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#mySendInviteModal">
            <span class="glyphicon glyphicon-envelope" aria-hidden="true"/>
        </button>
    </span>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal--${topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <g:textField name="topicName" value="${topicName}" />
                    </div>
                    <div>
                        <span>Seriousness* :</span>
                        <g:select name="seriousness" from="${LinkShareEnums.Seriousness}"/>
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
