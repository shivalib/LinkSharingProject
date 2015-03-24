<div class="panel panel-default leftdiv">
    <g:if test="${resource}">
        <div class="panel-body">
            <div class="media ">
                <div class="media-left">
                    <a href="#">
                        <img src="${createLink(controller: "image", action: "renderImage", params: [path: resource.createdBy.photoPath])}"
                             class="media-object mediaFace">
                    </a>
                </div>

                <div class="media-body">
                    <h4 class="media-heading right">

                        <g:link controller="topic" action="index" id="${resource.topic.id}"
                                params="[loginUser: resource.createdBy.id]">${resource.topic.topicName}</g:link>

                    </h4>

                    <div>
                        <div>
                            <h4>${resource.createdBy.fullName}</h4>
                        </div>

                        <div>
                            @${resource.createdBy.username}
                        </div><br>
                    </div>

                    <div>
                        ${resource.description}
                    </div>
                    <br/>

                    <div>
                        <g:render template="/myTemplates/socialIcons"/>
                        <ls:checkResourceType resource="${resource}"/>
                    </div>
                </div><!--media body ends-->
            </div><!--media ends -->
        </div><!--panel body ends-->
    </g:if>
</div><!--panel ends-->