<g:each in="">
    <div class="panel-body">
        <div class="media ">
            <div class="media-left">
                <ls:userPhoto currentUser="${topic.createdBy}"/>
            </div>

            <div class="media-body">
                <h4 class="media-heading">
                    <g:link>${topic.topicName}</g:link>(${topic.visibility})
                </h4>

                <div>
                    <h5>@${topic.createdBy.username}

                        <span class="right">Posts
                            <div>${topic.resources.size()}</div>
                        </span>
                        <span class="right rightdiv">Subscriptions
                            <div>${topic.subscriptions.size()}</div>
                        </span>
                    </h5>
                </div>
                <br>

                <div>
                    <ls:isSubscribed currentUser="${loginUser}" topicID="${topic}"/>
                    <ls:isNotSubscribed currentUser="${loginUser}" topicID="${topic}"
                                        topicName="${topic.topicName}"/>
                </div>
            </div><!--media body ends-->
        </div><!--media ends -->
    </div><!--panel body ends-->
</g:each>