<!-- Modal : SEND iNVIATION -->
<div class="modal fade" id="mySendInviteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="mySendInviteModelLabel">Send Invitation</h4>
            </div>
            <div class="modal-body">
                <g:form class="loginform">
                    <div>
                        <span>Email* : </span>
                        <g:textField name="email"/>
                    </div>
                    <div>
                        <span>Topic* :</span>
                        <g:select name="topicList" from="${topicList}" ></g:select>
                    </div>
                    <div class="right">
                        <g:submitButton name="invite" class="btn btn-default" value="Invite"/>
                        <g:submitButton name="reset" class="btn btn-default" data-dismiss="modal" value="Cancel"/>
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