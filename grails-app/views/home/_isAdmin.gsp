<%@ page import="com.ig.LinkShare.applicationEnums.Visibility; com.ig.LinkShare.applicationEnums.Seriousness" %>
%{--todo move this template to its respective folder--}%

<span class="left">
    %{--${topicID.topicName}--}%
    <g:select name="visbility" class="visibility" from="${com.ig.LinkShare.applicationEnums.Visibility}" data-topic-id="${topicID.id}"/>

    <button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myEditModal-${topicID.topicName}">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
    </button>


    <button type="button" class="btn btn-default" aria-label="Left Align" title="trash">
        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
    </button>

</span>

<!-- Modal -->
<div class="modal fade" id="myEditModal-${topicID.topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Topic</h4>
            </div>
            <div class="modal-body">
                <g:form controller="topic" action="updateTopic" id="${topicID.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topicID.topicName}"/>
                    </div>
                    <div class="right">
                        <g:submitButton name="save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" class="btn btn-default" data-dismiss="modal" value="Close"/>
                    </div>
                </g:form>
            </div>

            %{--<div class="modal-footer">--}%
                %{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}%
                %{--<button type="button" class="btn btn-primary">Save changes</button>--}%
            %{--</div>--}%
        </div>
    </div>
</div>