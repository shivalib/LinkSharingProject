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
    <button type="button" class="btn btn-default btn-sm">
        <span><img src="${resource(dir: "images",file:"facebook.png" )}" class="icon"/></span>
    </button>

    <button type="button" class="btn btn-default btn-sm">
        <span><img src="${resource(dir: "images",file: "twitter-icon.png")}" class="icon"/></span>
    </button>

    <button type="button" class="btn btn-default btn-sm">
        <span><img src="${resource(dir: "images",file: "icon_google_plus.png")}" class="icon" /></span>
    </button>

    <span><g:link class="right">View post</g:link></span>

</div>