<div class="right rightdiv">
    <span><g:link controller="topic" action="updateResource" data-toggle="modal"
                  data-target="#myEditModal-${resource.id}">Edit</g:link></span>

    <span><g:link controller="topic" action="deleteResource" data-toggle="modal"
                  data-target="#myDeleteModal-${resource.id}">Delete</g:link></span>
</div>

<!-- Modal:edit -->
<div class="modal fade" id="myEditModal-${resource.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalEdit">Edit Resource</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="updateResource" id="${resource.id}">

                    <div>
                        <span>Resource Description*</span>
                        <g:textField name="description" value="${resource.description}"/>
                    </div>

                    <div class="right">
                        <g:submitButton name="save" class="btn btn-default" value="Save"/>
                        <g:submitButton name="close" class="btn btn-default" data-dismiss="modal" value="Close"/>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

<!-- Modal:trash -->
<div class="modal fade" id="myDeleteModal-${resource.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalTrash">Delete Resource</h4>
            </div>

            <div class="modal-body">
                <g:form controller="topic" action="deleteResource" id="${resource.id}">
                    <div>
                        <span>Resource*</span>
                        <g:textField name="description" value="${resource.description}"/>
                    </div>
                    <br>

                    <div>
                        <span>Are you sure you want to delete this resource?</span>
                    </div>

                    <div class="right">
                        <g:submitButton name="delete" class="btn btn-default" value="Delete"/>
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
