<g:if test="${resourceList}">
    <div class="panel panel-default leftdiv">
        <g:each in="${resourceList}" var="resource">
            <div class="panel-body">
                <div class="media ">

                    <div class="media-left">
                        <ls:userPhoto currentUser="${resource.createdBy}"/>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading right">
                            <g:link controller="topic" action="index" id="${resource.topic.id}"
                                    params="[loginUser: loginUser.id]">${resource.topic.topicName}</g:link>
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
                        <ls:averageRating currentUser="${loginUser}" resource="${resource}"/>
                        <br/>

                        <div>
                            <g:render template="/myTemplates/socialIcons"/>
                            <ls:checkResourceType resource="${resource}"/>
                            <ls:isAdminOrCreatorOfResource resource="${resource}"/>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->

            </div><!--panel body ends-->
        </g:each>
    </div><!--panel ends-->
</g:if>
<g:else>
    <h4>Sorry there are no posts yet!</h4>
</g:else>