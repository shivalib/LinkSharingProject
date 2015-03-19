<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="loginLayout">
</head>

<body>
<div class="row">
    <div class="col-md-7">
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <g:link controller="user" action="UserProfile">
                            <img src="${createLink(controller: "image", action: "renderImage", params: [path: topic.createdBy.photoPath])}"
                                 class="media-object mediaFace">

                        </g:link>
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading">

                            ${topic.createdBy.fullName}
                            <span class="right">
                                <g:link controller="topic" action="index">${topic.topicName}</g:link>
                            </span>
                        </h4>
                        @${topic.createdBy.username}
                    </div>
                    <br>

                    <div>
                        ${topic.resources.description}
                    </div>
                </div><!--media ends-->
                <br/><br/>
                <g:render template="/myTemplates/socialIcons"/>
            </div><!--panel body ends-->
        </div>
    </div>

    <div class="col-md-5">
        <ls:checkUser/>
    </div>
</div>
</body>
</html>