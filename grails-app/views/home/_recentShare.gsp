<div class="media ">
    <div class="media-left">
        <ls:userPhoto currentUser="${res.createdBy}"/>
    </div>

    <div class="media-body">
        <h4 class="media-heading">${res.createdBy.fullName}@${res.createdBy.username}
            <span class="right">
                <ls:timeDiffInDetail oldDate="${res.dateCreated}"/>


                <g:link controller="topic" action="index" id="${res.topic.id}"
                        params="[loginUser: res.createdBy.id]">${res.topic.topicName}</g:link>

            </span></h4>
        ${res.description}
    </div>

    <g:render template="/myTemplates/socialIcons" model="[resourceID:res.id]"/>
    <span><g:link class="right" controller="post" action="index" id="${res.id}">View post</g:link></span>
</div>
