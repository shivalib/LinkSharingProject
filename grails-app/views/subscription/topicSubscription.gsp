<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="topicShowLayout"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title">Topic
                    <span class="input-group right" id="searchTextBox">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                    </span>

                </h3></span>

            </div>

            <div id="subDiv">

                <g:render template="allSubscription"
                          model="[max: max, offset: offset, subscriptions: subscriptions, loginUser: loginUser, subscriptionCount: subscriptionCount]"/>

            </div>
        </div>
    </div>

    <div class="col-md-7">
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Posts</h3>
            </div>

            <div class="panel-body">
                Panel content
            </div>
        </div>
    </div>
</div>

</body>
</html>