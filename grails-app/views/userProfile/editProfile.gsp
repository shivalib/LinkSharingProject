
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
    <meta name="layout" content="userProfileLayout">
</head>
<body>
<div class="row">
    <div class="col-md-5">

        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
                %{--<g:each in="${currentUser}" var="usr">--}%
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

            </div><!-- panel body ends-->
        </div><!--panel ends-->

        <!--Topics panel-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title ">Topics</h3>
            </div>

            <g:each in="${topicList}" var="topics">
            <div class="panel-body">
                <ls:topicListing topics="${topics}" loginUser="${loginUser}"></ls:topicListing>
            </div><!--panel body ends-->
            </g:each>
        </div><!--panel ends-->

    </div><!--col-md-5-->

    <!--Profile-->
    <div class="col-md-5">
      <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Profile</h3>
        </div>
        <div class="panel-body">
            <g:form class="loginform" controller="userProfile" action="updateData" enctype="multipart/form-data">
                <div>
                    <span>FirstName* :</span>
                    <g:textField name="firstName" value="${loginUser.firstName}"/>
                </div>
                <div>
                    <span>LastName* :</span>
                    <g:textField name="lastName" value="${loginUser.lastName}"/>
                </div>
                <div>
                    <span>Username* :</span>
                    <g:textField name="username" value="${loginUser.username}"/>
                </div>
                <div>
                    <span>Photo :
                    <input type="file" name="img">
                    </span>
                </div>
                <div class="right">
                    <g:submitButton name="update" value="Update"/>
                </div>
            </g:form>
        </div>
      </div><!--panel ends-->

    <!--Change password-->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Change Password </h3>
        </div>
        <div class="panel-body">
            <g:form class="loginform" controller="userProfile" action="changePassword">
                <div>
                    <span>Password* :</span>
                    <g:passwordField name="password"/>
                </div>
                <div>
                    <span>Confirm Password* :</span>
                    <g:passwordField name="confirmPassword"/>
                </div>
                <div class="right">
                    <g:submitButton name="update" value="Update"/>
                </div>
            </g:form>
        </div>
    </div><!--panel ends-->

</div><!--col-md-5-->

</div><!--row-->
</body>
</html>