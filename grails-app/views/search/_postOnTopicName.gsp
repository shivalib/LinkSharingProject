<g:each in="${resourceList}" var="resources">
    <div class="media ">
        <div class="media-left">
            <a href="#">
                <img src="${createLink(controller: "image", action: "renderImage", params: [path: resources.topic.createdBy.photoPath])}"
                     class="media-object mediaFace">
            </a>
        </div>

        <div class="media-body">
            <h4 class="media-heading"></h4>

            <div>
                ${resources.topic.createdBy.fullName}@${resources.topic.createdBy.username}
            </div>

            <div>
                ${resources.description}
            </div>
        </div><!--media body ends-->

        <div class="right leftdiv">
            <g:link>View Post</g:link>
        </div>
        <ls:checkResourceType resource="${resources}"/>
        <ls:markResource resource="${resources}" currentUser="${loginUser}"/>
    </div>
</g:each>