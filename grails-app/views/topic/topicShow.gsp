<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout">
    <asset:javascript src="topicShow.js"/>
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
        <!--topic details-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Topic : ${topic.topicName}</h3>
            </div>

            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="${createLink(controller: "userProfile", action: "showUserPublicProfile", params: [id: topic.createdBy.id])}">
                            <img src="${createLink(controller: "image", action: "renderImage", params: [path: topic.createdBy.photoPath])}"
                                 class="media-object mediaFace">
                        </a>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">
                            <g:link>${topic.topicName}</g:link>(${topic.visibility})
                        </h4>

                        <div>
                            <h5>@${topic.createdBy.username}

                                <span class="right">Posts
                                    <div>${topic.resources.size()}</div>
                                </span>
                                <span class="right rightdiv">Subscriptions
                                    <div>${topic.subscriptions.size()}</div>
                                </span>
                            </h5>
                        </div>
                        <br>

                        <div>
                            <ls:isSubscribed currentUser="${loginUser}" topicID="${topic}"/>
                            <ls:isNotSubscribed currentUser="${loginUser}" topicID="${topic}"
                                                topicName="${topic.topicName}"/>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!--panel body ends-->
        </div><!-- panel ends-->

    <!--users-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Users : ${topic.topicName}</h3>
            </div>
            <g:each in="${subscribers}" var="subscriberList">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <img src="${createLink(controller: "image", action: "renderImage", params: [path: subscriberList.user.photoPath])}"
                                     class="media-object mediaFace">
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading">${subscriberList.user.fullName}</h4>

                            <div>
                                <h5>@${subscriberList.user.username}</h5>
                            </div>

                            <div>
                                <span class="left leftdiv">Subscriptions
                                    <div>${subscriberList.user.subscriptions.size()}</div>
                                </span>
                                <span class="left leftdiv">Topics
                                    <div>${subscriberList.user.topics.size()}</div>
                                </span>
                            </div>
                        </div><!--media body ends-->
                    </div><!--media ends -->
                </div><!--panel body ends-->
            </g:each>
        </div><!-- panel ends-->
    </div><!--col md-5 ends-->

<!--posts-->
    <div class="col-md-7">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title ">Posts :
                    <span class="input-group right">
                        <input type="text" id="searchPost"
                               placeholder="Search for..."
                               onkeyup="searchPostUsingAjax('${createLink(controller: "search", action: "searchPost")}')"/>
                    </span>
                </h3></span>

            </div>
            <g:each in="${resources}" var="resourceList">
                <g:render template="/showPost/topicPost" model="[resourceList: resourceList]"/>
            </g:each>
        </div>

    </div>
</div>
</body>

</html>