<div class="media ">
    <div class="media-left">
        <g:link  controller="userProfile" action="showUserPublicProfile">
            <img src="${createLink(controller: "image", action: "renderImage", params: [path: res.topic.createdBy.photoPath])}"
                 class="media-object mediaFace">
        </g:link>
    </div>
    <div class="media-body">
        <h4 class="media-heading">${res.createdBy.fullName}@${res.createdBy.username}
            <span class="right">
                <ls:timeDiffInDetail oldDate="${res.dateCreated}"/>
                <g:link>${res.topic.topicName}</g:link>
            </span> </h4>
        ${res.description}
    </div>

    <g:render template="/myTemplates/socialIcons"/>
    <span><g:link class="right" controller="showPost" action="index" id="${res.id}">View post</g:link></span>
</div>
