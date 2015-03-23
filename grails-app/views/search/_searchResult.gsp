<g:each in="${resourceList}" var="resource">
    <div class="media ">
        <div class="media-left">
            <a href="#">
                <img src="${createLink(controller: "image", action: "renderImage", params: [path: resource.topic.createdBy.photoPath])}"
                     class="media-object mediaFace">
            </a>
        </div>

        <div class="media-body">

            <h4 class="media-heading">${resource.topic.createdBy.fullName}@ ${resource.topic.createdBy.username}
                <span class="right">

                    <g:link controller="topic" action="index">${resource.topic.topicName}</g:link>
                </span></h4>
            ${resource.description}

        </div><!--media body ends-->

        <div class="right leftdiv">
            <g:link class="right" controller="showPost" action="index" id="${resource.topic.id}">View post</g:link>
        </div>
        <ls:checkResourceType resource="${resource}"/>
        <ls:markResource resource="${resource}" currentUser="${loginUser}"/>
    </div>
</g:each>
