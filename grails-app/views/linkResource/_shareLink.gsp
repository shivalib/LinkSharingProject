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