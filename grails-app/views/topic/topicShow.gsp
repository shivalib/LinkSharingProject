<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topic</title>
    <meta name="layout" content="dashboardLayout">
    <asset:javascript src="topicShow.js"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <!--topic details-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Topic : ${topic.topicName}</h3>
            </div>

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
                            <ls:ifAlreadySubscribed topic="${topic}"/>
                            <ls:isSubscribed currentUser="${loginUser}" topicID="${topic}"/>
                            <ls:isNotSubscribed currentUser="${loginUser}" topicID="${topic}"
                                                topicName="${topic.topicName}"/>

                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!--panel body ends-->
        </div><!-- panel ends-->

    <!--users-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Users : ${topic.topicName}</h3>
            </div>
            <div id="updateSubscribers">
                <g:render template="subscribersOfTopic" model="[subscribersCount:subscribersCount,max:max,offset:offset,topicID:topic.id]"/>
            </div>
        </div><!-- panel ends-->
    </div><!--col md-5 ends-->

<!--posts-->
    <div class="col-md-7">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Posts :
                    <span class="input-group right">
                        <input type="text" id="searchPost"
                               placeholder="Search for..."
                               onkeyup="searchPostUsingAjax('${createLink(controller: "search", action: "searchPost")}')"/>
                    </span>
                </h3></span>

            </div>
            <g:each in="${resources}" var="resourceList">
                <g:render template="/showPost/topicPost" model="[resourceList: resourceList]"/>
            </g:each>
        </div>

    </div>
</div>
</body>

</html>