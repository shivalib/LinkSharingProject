<%@ page import="com.ig.LinkShare.applicationEnums.Visibility" contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout">
    %{--<asset:javascript src="dashboard.js"/>--}%
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="${createLink(controller: "userProfile", action: "showUserPublicProfile",params: [id:loginUser.id])}">
                            <img src="${createLink(controller: "image", action: "renderImage", params: [path: loginUser.photoPath])}"
                                 class="media-object mediaFace">
                        </a>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">
                            ${loginUser.fullName}
                        </h4>

                        <div>
                            <h5>@${loginUser.username}</h5>
                        </div>

                        <div>
                            <span class="left leftdiv">Subscriptions
                                <div>${loginUser.subscriptions.size()}</div>
                            </span>
                            <span class="left leftdiv">Topics
                                <div>${loginUser.topics.size()}</div>
                            </span>
                        </div>

                        <div>
                            <span class="left leftdiv"></span>
                            <span class="left leftdiv"></span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!-- panel body ends-->
        </div><!--panel ends-->

    <!--Subscriptions-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Subscriptions
                    <span class="right">
                        <g:link controller="subscription" action="showAllSubscriptions"
                                params="[allSubscriptions: loginUser.subscriptions]">View all</g:link>
                    </span>
                </h3></span>
            </div>

            <div id="updateSubscriptions">
                <g:render template="subscriptionOfCurrentUser"/>
            </div>
        </div><!--panel ends -->

    <!--Trending topic-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topic</h3>
            </div>
            <div id="updateTrendingDiv">
                <g:render template="/dashboard/trendingTopics" model="[max:max,offset: offset,trendingTopicList:trendingTopicList]"/>
            </div>

        </div><!-- panel ends-->

    </div><!-- col-md-4 -->
    <div class="col-md-7">
        <!--INBOX-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Inbox
                    <span class="input-group right" id="searchTextBox">
                        <input type="text" id="searchInbox"
                               placeholder="Search for..."
                               onkeyup="searchInboxUsingAjax('${createLink(controller: "search", action: "searchInbox")}')"/>
                    </span>
                </h3></span>
            </div>

            <div id="inboxDiv">
                <g:render template="/dashboard/iterateInbox"
                          model="[readingItemListWithIsReadFalse: readingItemListWithIsReadFalse,max:max,offset:offset,inboxCount:inboxCount]"/>
            </div>
        </div><!--panel ends-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Search for :</h3>
            </div>
            <div class="panel-body">
                <div class="addSearchData">

                </div>
                %{--<g:render template="/search/searchResult"/>--}%
            </div>
        </div>
    </div><!--col-md-7-->
</div>
</body>
</html>