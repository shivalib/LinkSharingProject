<%@ page import="com.ig.LinkShare.applicationEnums.Visibility; com.ig.LinkShare.applicationEnums.Seriousness" %>

<span class="left" id="visibilitySpan">
   <g:render template="/home/adminOptions" model="[topic:topic]"/>

</span>

<!-- Modal:edit -->
<div class="modal fade" id="myEditModal-${topic.topicName}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalEdit">Edit Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="updateTopic" id="${topic.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topic.topicName}"/>
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

<!-- Modal:trash -->
<div class="modal fade" id="myEditModal-${topic.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalTrash">Delete Topic</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="deleteTopic" id="${topic.id}">
                    <div>
                        <span>Topic*</span>
                        <g:textField name="topicName" value="${topic.topicName}"/>
                    </div>
                    <br>

                    <div>
                        <span>Are you sure you want to delete this topic?</span>
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
