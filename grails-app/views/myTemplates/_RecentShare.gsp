<div class="media ">
    <div class="media-left">
        <a href="${createLink(controller: "userProfile", action: "showUserPublicProfile", params: [id: res.createdBy.id])}">

            <img src="${createLink(controller: "image", action: "renderImage", params: [path: res.createdBy.photoPath])}"
                 class="media-object mediaFace">
        </a>
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
    <span><g:link class="right" controller="showPost" action="index" id="${res.id}">View post</g:link></span>
</div>
