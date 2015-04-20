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
        <secUser:ifAllGrantedRoleAndAction roles="ROLE_ADMIN" actionName="${actionName}">
            post for admin
            <g:render template="postForAdmin" model="[resourceList: resourceList, loginUser: loginUser]"/>
        </secUser:ifAllGrantedRoleAndAction>

        <secUser:ifAnyGrantedRoleAndAction roles="ROLE_USER,ROLE_ADMIN" actionName="${actionName}">
            <g:render template="postForNonAdmin" model="[resource: resource, loginUser: loginUser]"/>
        </secUser:ifAnyGrantedRoleAndAction>

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