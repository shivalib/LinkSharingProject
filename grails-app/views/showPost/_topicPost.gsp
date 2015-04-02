<div class="panel-body updateReadingItem ">
    <div class="media ">
        <div class="media-left">
            <a href="#">
                <img src="${createLink(controller: "image", action: "renderImage", params: [path: resourceList.createdBy.photoPath])}"
                     class="media-object mediaFace">
            </a>
        </div>

        <div class="media-body">
            <h4 class="media-heading">
                <g:link controller="topic" action="index" id="${resourceList.topic.id}"
                        params="[loginUser: loginUser.id]">${resourceList.topic.topicName}</g:link>
            </h4>
            ${resourceList.description}
        </div><!--media body ends-->
    </div><!--media ends-->
    <div class="right leftdiv">
        <g:link>View Post</g:link>
    </div>
    <ls:checkResourceType resource="${resourceList}"/>
    <ls:markResource resource="${resourceList}" ajaxClass="readUnread-post" currentUser="${loginUser}"/>
</div><!--panel body ends-->
