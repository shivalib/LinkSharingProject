%{--todo move this template to its respective folder--}%

<div class="right">
    <g:select name="seriousness" from="${LinkShareEnums.Seriousness}"/>
    <button type="button" class="btn btn-default" title="Send invitation" data-toggle="modal"
            data-target="#mySendInviteModal">
        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
    </button>
</div>