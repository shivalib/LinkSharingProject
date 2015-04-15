<%@ page import="com.ig.LinkShare.applicationEnums.Visibility" contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Dashboard</title>
    <meta name="layout" content="dashboardLayout">
</head>

<body>

<g:render template="/resource/socialIconJS"/>

<div class="row">
    <div class="col-md-5">
        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                <g:render template="/dashboard/userPanel" model="[loginUser: loginUser]"/>
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

            <div id="updateSubscriptions" class="leftdiv">
                <g:render template="subscriptionOfCurrentUser"/>
            </div>
        </div><!--panel subscription ends -->

    <!--Trending topic-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topic</h3>
            </div>

            <div id="updateTrendingDiv" class="leftdiv">
                <g:render template="/dashboard/trendingTopics"
                          model="[trendingTopicList: trendingTopicList]"/>
            </div>
        </div><!-- panel ends-->
    </div>
</div>


%{--<div class="col-md-7">--}%
%{--<!--INBOX-->--}%
%{--<div class="panel panel-default rightdiv">--}%
%{--<div class="panel-heading">--}%
%{--<span><h3 class="panel-title ">Inbox--}%
%{--<span class="input-group right" id="searchTextBox">--}%
%{--<input type="text" id="searchInbox"--}%
%{--placeholder="Search for..."--}%
%{--onkeyup="searchInboxUsingAjax('${createLink(controller: "search", action: "searchInbox")}')"/>--}%
%{--</span>--}%
%{--</h3></span>--}%
%{--</div>--}%

%{--<div id="inboxDiv">--}%
%{--<g:render template="/dashboard/iterateInbox"--}%
%{--model="[readingItemListWithIsReadFalse: readingItemListWithIsReadFalse, max: max, offset: offset, inboxCount: inboxCount]"/>--}%
%{--</div>--}%
%{--</div><!--panel ends-->--}%
%{--</div><!--col-md-7-->--}%
%{--</div>--}%
</body>
</html>