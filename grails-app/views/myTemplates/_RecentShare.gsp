<div class="media ">
    <div class="media-left">
        <g:link  controller="user" action="UserProfile">
            <img class="media-object mediaFace" src="${resource(dir: "images",file:"person-icon.png")}" alt="Person">
        </g:link>
    </div>
    <div class="media-body">
        <h4 class="media-heading">${res.createdBy.firstName}&nbsp;${res.createdBy.lastName}@${res.createdBy.username}<span class="right"><a href="${resource(dir: "user",file: "TopicShow")}">${res.topic.topicName}</a></span> </h4>
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
    <span><a href="" class="right">View post</a></span>
</div>