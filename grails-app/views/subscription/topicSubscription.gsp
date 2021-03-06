<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topic Subscription</title>
    <meta name="layout" content="dashboardLayout">
    <asset:javascript src="subscription.js"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title">Topic
                    <span class="input-group right" id="searchTextBox">
                        <input type="text" id="searchText"
                               class="form-control"
                               placeholder="Search for..."
                               onkeyup="searchTopicUsingAjax('${createLink(controller: 'search',action: 'searchTopic')}')">
                    </span>
                </h3></span>

            </div>

            <div id="updateSearchResult">
                <g:render template="allSubscription"
                          model="[max: max, offset: offset, subscriptions: subscriptions, loginUser: loginUser, subscriptionCount: subscriptionCount]"/>
            </div>
        </div>
    </div>

    <div class="col-md-7">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Posts</h3>
            </div>
            <div class="panel-body updateReadingItem">
                    <h4>Click on a topic name to see the posts!</h4>
            </div>
        </div>
    </div>
</div>

</body>
</html>