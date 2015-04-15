<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <span><h2 class="panel-title">Topic List
                </h2></span>

            </div>
            <g:render template="/topic/allTopicsCreated" model="[topicList: topicList]"/>
        </div>
    </div>
</div>
</body>
</html>