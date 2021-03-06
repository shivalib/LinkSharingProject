<g:if test="${subscriptions}">
    <g:each in="${subscriptions}" var="subscriptionList">
        <div class="panel-body">
            <div class="media ">
                <div class="media-left">
                    <ls:userPhoto currentUser="${subscriptionList.topic.createdBy}"/>
                </div>

                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="javascript:void(0)" class="topicLink" ajax-id="${subscriptionList.topic.id}"
                           data-ajax-searchPost='${createLink(controller: 'search', action: 'displayPostOnTopicNameClick')}'>${subscriptionList.topic.topicName}</a>
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
</g:if>
<g:else>
    <h4>No topics have been created yet!</h4>
</g:else>
