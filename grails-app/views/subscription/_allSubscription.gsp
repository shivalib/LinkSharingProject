<g:each in="${subscriptions}" var="subscriptionList">
    <div class="panel-body">
        <div class="media ">
            <div class="media-left">
                <a href="#">
                    <img src="${createLink(controller: "image", action: "renderImage", params: [path: subscriptionList.topic.createdBy.photoPath])}"
                         class="media-object mediaFace">
                    %{--<g:img class="media-object mediaFace" dir="images" file="person-icon.png"--}%
                    %{--alt="Person"></g:img>--}%
                </a>
            </div>

            <div class="media-body">
                <h4 class="media-heading">
                    <g:link controller="topic" action="index" id="${subscriptionList.id}"
                            params="[loginUser: loginUser.id]">${subscriptionList.topic.topicName}</g:link>
                </h4>

                <div>
                    @${subscriptionList.user.username}
                    <span class="right">Posts
                        <div>${subscriptionList.topic.resources.size()}</div>
                    </span>
                    <span class="right rightdiv">Subscriptions
                        <div>${subscriptionList.topic.subscriptions.size()}</div>
                    </span>
                </div>
                <br><br><br>

                <div>
                    <ls:isEditable currentUser="${loginUser}"
                                   topicCreater="${subscriptionList.topic.createdBy}"
                                   topicID="${subscriptionList.topic.id}"/>
                </div>
            </div><!--media body ends-->
        </div><!-- media ends-->

    </div>
</g:each>
<util:remotePaginate controller="subscription" action="paginate" total="${subscriptionCount}" max="${max}" offset="${offset}" update="subDiv"/>