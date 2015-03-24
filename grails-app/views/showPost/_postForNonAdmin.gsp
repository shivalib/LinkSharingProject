<div class="panel panel-default leftdiv">
    <div class="panel-body">
        <div class="media ">

            <div class="media-left">
                <a href="${createLink(controller: "userProfile",action: "showUserPublicProfile",params: [id:resource.createdBy.id])}">
                    <img src="${createLink(controller: "image", action: "renderImage", params: [path: resource.createdBy.photoPath])}"
                         class="media-object mediaFace">
                </a>
            </div>

            <div class="media-body">
                <h4 class="media-heading right">
                    <g:link controller="topic" action="index" id="${resource.topic.id}"
                            params="[loginUser: loginUser.id]">${resource.topic.topicName}</g:link>
                </h4>

                <div>
                    <div>
                        <h4>${resource.createdBy.fullName}</h4>
                    </div>

                    <div>
                        @${resource.createdBy.username}
                    </div><br>
                </div>

                <div>
                    ${resource.description}
                </div>

                <div class="ratyDiv" data-resourceID="${resource.id}"
                     data-rateLink="${createLink(controller: "showPost", action: "rateResource")}" data-avg="${averageRating}">

                </div>
                <div>
                    <h5>Average :${averageRating}</h5>
                </div>
                <br/>

                <div>
                    <g:render template="/myTemplates/socialIcons"/>
                    <ls:checkResourceType resource="${resource}"/>
                    <ls:isAdminOrCreatorOfResource currentUser="${loginUser}" resource="${resource}"/>
                </div>

            </div><!--media body ends-->

        </div><!--media ends -->

    </div><!--panel body ends-->
</div><!--panel ends-->