<g:each in="${top5SubscribedTopics}" var="subscribedTopics">
    <div class="panel-body" id="startDiv">
        <div class="media ">
            <div class="media-left">
                <a href="#">
                    <img src="${createLink(controller: "image", action: "renderImage", params: [path: subscribedTopics.createdBy.photoPath])}"
                         class="media-object mediaFace">
                </a>
            </div>

            <div class="media-body">
                <h4 class="media-heading">
                    <g:link controller="topic" action="index" id="${subscribedTopics.id}"
                            params="[loginUser: loginUser.id]">${subscribedTopics.topicName}</g:link>
                </h4>

                <div>
                    @${subscribedTopics.createdBy.username}
                    <span class="right">Posts
                        <div>${subscribedTopics.resources.size()}</div>
                    </span>
                    <span class="right rightdiv">Subscriptions
                        <div>${subscribedTopics.subscriptions.size()}</div>
                    </span>
                </div>
                <br><br><br>

                <div class="updateTags">
                    <ls:isEditable currentUser="${loginUser}"
                                   topicCreater="${subscribedTopics.createdBy}"
                                   topicID="${subscribedTopics.id}"/>
                </div>
            </div><!--media body ends-->
        </div><!-- media ends-->
    </div><!-- panel body ends-->
</g:each>
%{--<util:remotePaginate controller="home" action="showRecentShare" total="${top5SubscribedTopics.count()}" update="updateRecentShare"/>--}%