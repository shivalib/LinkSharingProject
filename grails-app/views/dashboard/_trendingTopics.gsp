<g:each in="${trendingTopicList}" var="trending">
    <div class="panel-body">
        <div class="media ">
            <div class="media-left">
                <ls:userPhoto currentUser="${trending.createdBy}"/>
            </div>

            <div class="media-body">
                <h4 class="media-heading">
                    <g:link controller="topic" action="index" id="${trending.id}"
                            params="[loginUser: loginUser.id]">${trending.topicName}</g:link>
                </h4>

                <div>
                    <div>
                        @${trending.createdBy.username}
                        <span class="right">Posts
                            <div>${trending.resources.size()}</div>
                        </span>
                        <span class="right rightdiv">Subscriptions
                            <div>${trending.subscriptions.size()}</div>
                        </span>
                    </div><br>
                </div>

                <div>
                    <ls:isSubscribed currentUser="${loginUser}" topicID="${trending}"/>

                    <ls:isNotSubscribed currentUser="${loginUser}" topicID="${trending}"
                                        topicName="${trending.topicName}"/>
                </div>
            </div><!--media body ends-->
        </div><!--media ends -->
    </div><!--panel body ends-->
</g:each>

<util:remotePaginate controller="home" action="paginateTrendingTopics" total="${trendingCount}" max="${max}"
                     offset="${offset}" update="updateTrendingDiv"/>