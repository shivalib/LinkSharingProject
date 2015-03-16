<div class="media ">
    <div class="media-left">
        <a href="#">
            <img class="media-object mediaFace"
                 src="${resource(dir: "images", file: "person-icon.png")}">
        </a>
    </div>

    <div class="media-body">
        <h4 class="media-heading"></h4>

        <div>
            ${unreadItem.resource.topic.createdBy.fullName}@ ${unreadItem.resource.topic.createdBy.username}
        </div>

        <div>
            ${unreadItem.resource.description}
        </div>
    </div><!--media body ends-->

    <div class="right leftdiv">
        <g:link>View Post</g:link>
    </div>
    <ls:checkResourceType resource="${unreadItem.resource}"/>
    <ls:markResource resource="${unreadItem.resource}" currentUser="${loginUser}"/>
</div>