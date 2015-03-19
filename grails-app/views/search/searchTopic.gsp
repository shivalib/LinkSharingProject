
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topic Search</title>
    <meta name="layout" content="topicShowLayout">

</head>

<body>

%{--.................tadaaaaaaaaaan !!!!!!!!!!!!!!--}%
<div class="row">
    <div class="col-md-5">
        <g:render template="trendingTopic" model="[trendingTopicList:trendingTopicList]"/>
    </div>
    <div class="col-md-7">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Search for : </h3>
            </div>
            <div class="panel-body">

            </div>
        </div>
    </div>
</div>
</body>
</html>