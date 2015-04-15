<g:each in="${resourceList}" var="resource">
    <div class="media ">
        <div class="media-left">
            <ls:userPhoto currentUser="${resource.topic.createdBy}"/>
        </div>

        <div class="media-body">

            <h4 class="media-heading">${resource.topic.createdBy.fullName}@ ${resource.topic.createdBy.username}
                <span class="right">

                    <g:link controller="topic" action="index">${resource.topic.topicName}</g:link>
                </span></h4>
            ${resource.description}

        </div><!--media body ends-->

        <div class="right leftdiv">
            <g:link class="right" controller="showPost" action="index" id="${resource.topic.id}">View post</g:link>
        </div>
        <g:render template="/myTemplates/socialIcons" model="[resourceID:resource.id]"/>
        <ls:checkResourceType resource="${resource}"/>
        <ls:markResource resource="${resource}" ajaxClass="readUnread-post" currentUser="${loginUser}"/>
    </div>
</g:each>
