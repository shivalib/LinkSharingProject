
<g:link controller="subscription" id="Link-${topic.topicName}" action="subscribeUser" data-toggle="modal"
        data-target="#myModal-${topic.topicName}">Subscribe</g:link>

<!-- Modal -->
<div class="modal fade" id="myModal-${topic.topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                        <g:select name="seriousness" from="${com.ig.LinkShare.applicationEnums.Seriousness}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="Save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" value="Close" class="btn btn-default"
                                        data-dismiss="modal"></g:submitButton>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
