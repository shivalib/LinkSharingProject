<g:if test="${top5SubscribedTopics}">
    <g:each in="${top5SubscribedTopics}" var="subscribedTopics">
        <div class="panel-body" id="startDiv">
            <div class="media ">

                <div class="media-left">
                    <ls:userPhoto currentUser="${subscribedTopics.createdBy}"/>

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
                        <span class="right rightdiv">
                            Subscriptions
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
%{--<util:remotePaginate controller="home" action="paginateUserSubscription" total="${subscriptionCount}" max="${max}"--}%
%{--offset="${offset}"--}%
%{--update="updateSubscriptions"/>--}%
</g:if>
<g:else>
    <h4>You haven't created or subscribed to any topics yet!</h4>
</g:else>
