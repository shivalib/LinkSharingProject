<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <g:render template="/topic/allTopicsCreated" model="[topicList: topicList]"/>
    </div>
</div>
</body>
</html>