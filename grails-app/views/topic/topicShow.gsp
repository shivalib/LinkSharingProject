
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout">
</head>

<body>
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
                        <a href="#">
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
                            <ls:isNotSubscribed currentUser="${loginUser}" topicID="${topic}" topicName="${topic.topicName}"/>
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
                <span><h3 class="panel-title ">Posts : ${topic.topicName}</h3></span>
                <span>
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                    </form>
                </span>
            </div>
            <g:each in="${resources}" var="resourceList">
                <div class="panel-body updateReading">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <img src="${createLink(controller: "image", action: "renderImage", params: [path: resourceList.createdBy.photoPath])}"
                                     class="media-object mediaFace">
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading"><a href=""></a></h4>
                            ${resourceList.description}
                        </div><!--media body ends-->
                    </div><!--media ends-->
                    <div class="right leftdiv">
                        <g:link>View Post</g:link>
                    </div>
                    <ls:checkResourceType resource="${resourceList}"/>
                    <ls:markResource resource="${resourceList}" currentUser="${loginUser}"/>
                </div><!--panel body ends-->
            </g:each>
        </div>

    </div>
</div>
</body>

</html>