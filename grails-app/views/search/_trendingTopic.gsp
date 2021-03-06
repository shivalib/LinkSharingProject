<!--Trending topic-->
<div class="panel panel-default leftdiv">
    <div class="panel-heading">
        <h3 class="panel-title">Trending Topic</h3>
    </div>
    <g:each in="${trendingTopicList}" var="trending">
        <div class="panel-body">
            <div class="media ">
                <div class="media-left">
                    <ls:userPhoto currentUser="${trending.createdBy}"/>
                </div>

                <div class="media-body">
                    <h4 class="media-heading">
                        <g:link controller="topic" action="index" id="${trending.id}"
                                params="[loginUser: trending.createdBy.id]">${trending.topicName}</g:link>
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
                    <sec:ifLoggedIn>
                        <div>
                            <ls:isSubscribed currentUser="${loginUser}" topicID="${trending}"/>

                            <ls:isNotSubscribed currentUser="${loginUser}" topicID="${trending}"
                                                topicName="${trending.topicName}"/>
                        </div>
                    </sec:ifLoggedIn>
                </div><!--media body ends-->
            </div><!--media ends -->
        </div><!--panel body ends-->
    </g:each>
</div><!-- panel ends-->
