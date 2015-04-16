<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Post</title>
    <g:if test="${loginUser}">
        <meta name="layout" content="dashboardLayout">
    </g:if>
    <g:else>
        <meta name="layout" content="loginLayout">
    </g:else>
<!-- raty : rating -->
    <asset:javascript src="jquery.raty.js"/>
    <asset:stylesheet src="jquery.raty.css"/>
    <asset:javascript src="postRating.js"/>
</head>

<body>
<div class="row">
    <div class="col-md-7">
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <g:render template="postForAdmin"/>
        </sec:ifAllGranted>

        <sec:ifAllGranted roles="ROLE_USER">
            <g:render template="postForNonAdmin"/>
        </sec:ifAllGranted>

        <sec:ifNotGranted roles="ROLE_USER,ROLE_ADMIN">
            <g:render template="postForNonRegisteredUser"/>
        </sec:ifNotGranted>
    </div><!--col-md-7 ends-->

    <div class="col-md-5">
        <sec:ifLoggedIn>
            <!--Trending topic-->
            <g:render template="/search/trendingTopic"/>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <g:render template="/home/notLogin"/>
        </sec:ifNotLoggedIn>
    </div>

</div>

</body>
</html>