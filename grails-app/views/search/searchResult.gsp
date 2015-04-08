<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search Result</title>
    <meta name="layout" content="dashboardLayout">
    <script>

    </script>
</head>

<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<script src="https://apis.google.com/js/platform.js" async defer></script>


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