<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Profile</title>
    <meta name="layout" content="dashboardLayout"/>
</head>

<body>
<div class="row">
    <div class="col-md-5">
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
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
            </div><!--panel body ends-->
        </div><!--panel ends-->

        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Topics</h3>
            </div>
            <g:each in="${topicList}" var="topics">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-body">
                            <h4 class="media-heading">
                                <g:link controller="topic" action="index" id="${topics.id}"
                                        params="[loginUser: loginUser.id]">${topics.topicName}</g:link>
                            </h4>

                            <div>
                                <span class="right ">Posts
                                    <div>${topics.resources.size()}</div>
                                </span>

                                <span class="right rightdiv">Subscriptions
                                    <div>${topics.subscriptions.size()}</div>
                                </span>

                            </div>

                        </div><!--media body ends-->
                        <div>
                            <ls:isSubscribed currentUser="${loginUser}" topicID="${topics}"/>

                            <ls:isNotSubscribed currentUser="${loginUser}" topicID="${topics}"
                                                topicName="${topics.topicName}"/>
                        </div>
                    </div><!--media ends -->

                </div><!--panel body ends-->
            </g:each>
        </div><!-- panel ends-->
    </div>

    <div class="col-md-7">
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Posts</h3>
            </div>
            <g:each in="${resourcesOfTopic}" var="resource">
                <g:render template="/showPost/topicPost" model="[resourceList: resource, loginUser: loginUser]"/>
            </g:each>
        </div><!-- panel ends-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Search for :</h3>
            </div>

            <div class="panel-body">
                <div class="addSearchData">

                </div>
            </div>
        </div>
    </div><!--col-md-7 ends-->
</div>

</body>
</html>