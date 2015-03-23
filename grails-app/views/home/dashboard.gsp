<%@ page import="com.ig.LinkShare.applicationEnums.Visibility" contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout">
    <asset:javascript src="dashboard.js"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="${createLink(controller: "userProfile", action: "showUserPublicProfile")}">
                            <img src="${createLink(controller: "image", action: "renderImage", params: [path: loginUser.photoPath])}"
                                 class="media-object mediaFace">
                        </a>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">
                            ${loginUser.fullName}
                        </h4>

                        <div>
                            <h5>@${loginUser.username}</h5>
                        </div>

                        <div>
                            <span class="left leftdiv">Subscriptions
                                <div>${loginUser.subscriptions.size()}</div>
                            </span>
                            <span class="left leftdiv">Topics
                                <div>${loginUser.topics.size()}</div>
                            </span>
                        </div>

                        <div>
                            <span class="left leftdiv"></span>
                            <span class="left leftdiv"></span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
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

            <div id="updateSubscriptions">
                <g:render template="subscriptionOfCurrentUser"/>
            </div>
        </div><!--panel ends -->

    <!--Trending topic-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topic</h3>
            </div>
            <g:each in="${trendingTopicList}" var="trending">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <img src="${createLink(controller: "image", action: "renderImage", params: [path: trending.createdBy.photoPath])}"
                                     class="media-object mediaFace">
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading">
                                <g:link controller="topic" action="index" id="${trending.id}"
                                        params="[loginUser: loginUser.id]">${trending.topicName}</g:link>
                            </h4>

                            <div>
                                <div>
                                    @${trending.createdBy.username}
                                    <span class="right">Posts
                                        <div>${trending.resources.size()}</div>
                                    </span>
                                    <span class="right rightdiv">Subscriptions
                                        <div>${trending.subscriptions.size()}</div>
                                    </span>
                                </div><br>
                            </div>

                            <div>
                                <ls:isSubscribed currentUser="${loginUser}" topicID="${trending}"/>

                                <ls:isNotSubscribed currentUser="${loginUser}" topicID="${trending}"
                                                    topicName="${trending.topicName}"/>
                            </div>
                        </div><!--media body ends-->
                    </div><!--media ends -->
                </div><!--panel body ends-->
            </g:each>
        </div><!-- panel ends-->

    </div><!-- col-md-4 -->
    <div class="col-md-7">
        <!--INBOX-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Inbox
                    <span class="input-group right" id="searchTextBox">
                        <input type="text" id="searchInbox"
                               placeholder="Search for..."
                               onkeyup="searchInboxUsingAjax('${createLink(controller: "search", action: "searchInbox")}')"/>
                    </span>
                </h3></span>
            </div>

            <div id="unreadDiv">
                <g:render template="/dashboard/iterateInbox"
                          model="[readingItemListWithIsReadFalse: readingItemListWithIsReadFalse]"/>
            </div>
        </div><!--panel ends-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Search for :</h3>
            </div>
            <div class="panel-body">
                <div class="addSearchData">

                </div>
                %{--<g:render template="/search/searchResult"/>--}%
            </div>
        </div>
    </div><!--col-md-7-->
</div>
<script>

    $('.markReadOrUnread').on('click', function () {
        console.log("******** mark as read*********");
        //_markAsRead->ajax->controller
        var currentUser = $(this).attr('data-currentUser'),
                currentResource = $(this).attr('data-currentResource'), currentPanelBody = $(this).closest('#inboxPanel');

        console.log(currentResource, currentUser);

        $.ajax({
            url: '${createLink(controller: "readingItem",action: "markAsReadOrUnread")}',

            data: {
                currentUser: currentUser,
                currentResource: currentResource
            },
            success: function (data) {
                console.log(data)

                if (data.result)
                    currentPanelBody.empty()

            },
            error: function (request, status, error) {
                console.log("We are in error section ");
                console.log("request :" + request);
                console.log("status : " + status);
                console.log("error :" + error);
            }
        });
    });



</script>
</body>
</html>