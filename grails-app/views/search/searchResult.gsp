<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search Result</title>
    <meta name="layout" content="dashboardLayout">
    <script>

    </script>
</head>

<body>

<g:render template="/resource/socialIconJS"/>

<div class="row">
    <div class="col-md-5">
        <g:render template="trendingTopic" model="[trendingTopicList: trendingTopicList]"/>
    </div>

    <div class="col-md-7">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Search for : ${searchValue}</h3>
            </div>

            <div class="panel-body">
                <div class="addSearchData">
                    <g:render template="globalSearchResult" resourceList="${resourceList}"/>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>
</body>
</html>