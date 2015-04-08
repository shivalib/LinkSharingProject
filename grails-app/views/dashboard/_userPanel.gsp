<div class="media ">
    <div class="media-left">
        <a href="${createLink(controller: "userProfile", action: "showUserPublicProfile", params: [id: loginUser.id])}">
            <img src="${createLink(controller: "image", action: "renderImage", params: [path: loginUser.photoPath])}"
                 class="media-object mediaFace">
        </a>
    </div>

    <div class="media-body">
        <h4 class="media-heading">
            ${loginUser.fullName}
        </h4>

        <div>
            <h5>@${loginUser.username}</h5>
        </div>

        <div>
            <span class="left leftdiv">

                <g:link controller="subscription" action="showAllSubscriptions">Subscriptions</g:link>

                <div>${loginUser.subscriptions.size()}</div>
            </span>
            <span class="left leftdiv">

                <g:link controller="subscription" action="showAllTopicsCreated">Topics</g:link>

                <div>${loginUser.topics.size()}</div>
            </span>
        </div>
    </div><!--media body ends-->
</div><!--media ends -->