%{--todo move this template to its respective folder--}%


<div class="media ">
    <div class="media-left">
        <g:link  controller="user" action="UserProfile">
            <img class="media-object mediaFace" src="${resource(dir: "images",file:"person-icon.png")}" alt="Person">
        </g:link>
    </div>
    <div class="media-body">
        <h4 class="media-heading">${res.createdBy.fullName}@${res.createdBy.username}
            <span class="right">
                <g:link controller="topic" action="index">${res.topic.topicName}</g:link>
            </span> </h4>

        ${res.description}

    </div>

    <g:render template="/myTemplates/socialIcons"/>
    <span><g:link class="right" controller="showPost" action="index" id="${res.topic.id}">View post</g:link></span>
</div>