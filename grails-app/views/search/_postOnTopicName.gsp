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
            <g:link class="right" controller="showPost" action="index" id="${resources.id}">View post</g:link>
        </div>

        <g:render template="/myTemplates/socialIcons" model="[resourceID:resources.id]"/>
        <ls:checkResourceType resource="${resources}"/>
        <ls:markResource resource="${resources}" currentUser="${loginUser}"/>
    </div>
</g:each>