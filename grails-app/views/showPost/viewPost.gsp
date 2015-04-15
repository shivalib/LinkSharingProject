<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Post</title>
    <g:if test="${loginUser}">
        <meta name="layout" content="dashboardLayout">
    </g:if>
    <g:else>
        <meta name="layout" content="loginLayout">
    </g:else>

<!-- raty : rating -->
    <asset:javascript src="jquery.raty.js"/>
    <asset:stylesheet src="jquery.raty.css"/>
    <asset:javascript src="postRating.js"/>
</head>

<body>
<div class="row">
    <div class="col-md-7">
        %{--<g:if test="${loginUser}">--}%
        %{--<ls:checkUserForPost currentUser="${loginUser}" topicList="${topicList}"/>--}%
        %{--</g:if>--}%
        %{--<g:else>--}%
        %{--<g:render template="postForNonRegisteredUser"/>--}%
        %{--</g:else>--}%

        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="postForAdmin"/>
        </sec:ifAllGranted>
        <sec:ifAllGranted roles="ROLE_USER">
            <g:render template="postForNonAdmin"/>
        </sec:ifAllGranted>
        <sec:ifNotGranted roles="ROLE_USER,ROLE_ADMIN">
            <g:render template="postForNonRegisteredUser"/>
        </sec:ifNotGranted>
    </div><!--col-md-7 ends-->

    <div class="col-md-5">
        <sec:ifLoggedIn>
            <!--Trending topic-->
            <div class="panel panel-default rightdiv">
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
            </div><!-- panel ends-->
        %{--<ls:checkUser/>--}%
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <g:render template="/home/notLogin"/>
        </sec:ifNotLoggedIn>
    </div>

</div>

</body>
</html>