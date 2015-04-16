<g:each in="${subscribers}" var="subscriberList">
    <div class="panel-body">
        <div class="media ">
            <div class="media-left">
                <ls:userPhoto currentUser="${subscriberList.user}"/>
            </div>

            <div class="media-body">
                <h4 class="media-heading">${subscriberList.user.fullName}</h4>

                <div>
                    <h5>@${subscriberList.user.username}</h5>
                </div>

                <div>
                    <span class="left leftdiv">Subscriptions
                        <div>${subscriberList.user.subscriptions.size()}</div>
                    </span>
                    <span class="left leftdiv">Topics
                        <div>${subscriberList.user.topics.size()}</div>
                    </span>
                </div>
            </div><!--media body ends-->
        </div><!--media ends -->
    </div><!--panel body ends-->
</g:each>
<util:remotePaginate controller="topic" action="paginateSubscribersOfTopic" id="${topicID}" max="${max}"
                     offset="${offset}" update="updateSubscribers" total="${subscribersCount}"/>