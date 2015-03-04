<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 9:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title></title>

    <meta name="layout" content="dashboardLayout">
</head>

<body>
<div class="row">
    <div class="col-md-4">
        <!--Panel1-->
        <div class="panel panel-default leftdiv">
            <div class="panel-body">
    %{--<g:each in="${currentUser}" var="usr">--}%
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">

                        <h4 class="media-heading">${loginUser.firstName} ${loginUser.lastName}</h4>
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
                <span><h3 class="panel-title " >Subscriptions</h3></span>
                <span class="right"><a href="">View All</a></span>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <g:img class="media-object mediaFace" dir="images" file="person-icon.png" alt="Person"></g:img>
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">topicName</a></h4>
                        This is a sample text to be replaced by the data

                        <div>
                            <span class="left">
                                <select name="SeriousnessList">
                                    <option name="serious">Serious</option>
                                    <option name="verySerious">Very Serious</option>
                                    <option name="casual">Casual</option>
                                </select>

                                <select name="TopicTypeList">
                                    <option name="public">Public</option>
                                    <option name="private">Private</option>
                                </select>

                                <button type="button" class="btn btn-default" title="Send invitation">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>

                    </div><!--media body ends-->
                </div><!-- media ends-->
            </div><!-- panel body ends-->

            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
                        This is a sample text to be replaced by the data
                        <div>
                            <span class="right">
                            <select name="SeriousnessList">
                            <option name="serious">Serious</option>
                            <option name="verySerious">Very Serious</option>
                            <option name="casual">Casual</option>
                            </select>

                            <button type="button" class="btn btn-default" title="Send invitation">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            </button>
                            </span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends-->
            </div><!--panel body ends-->
        </div><!--panel ends -->
    <!--Trending topic-->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Trending Topic (Pop up)</h3>
            </div>
            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir: "images", file:"person-icon.png")}">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="#">topicname</a></h4>
                        <div>
                            <h5>@username</h5>
                            <span class="right">Posts</span>
                            <span class="right rightdiv">Subscriptions</span>
                            <span class="left"><a href="#">Subscribe</a></span>
                        </div>
                        <div>
                            <span class="right">
                                <select name="SeriousnessList">
                                    <option name="serious">Serious</option>
                                    <option name="verySerious">Very Serious</option>
                                    <option name="casual">Casual</option>
                                </select>
                                <button type="button" class="btn btn-default" title="Send invitation">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>
                    </div><!--media body ends-->
                </div><!--media ends -->
            </div><!--panel body ends-->
        </div><!-- panel ends-->

    <!-- Send Invitation -->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Send invitation (Pop up)</h3>
            </div>
            <div class="panel-body">
                <form class=loginform>
                    <div>
                        <span>Email* : </span>
                        <g:textField name="email"></g:textField>
                    </div>
                    <div>
                        <select name="topics">
                            <option>Topic 1
                            <option>Topic 2
                            <option>Topic 3
                            <option>Topic 4
                        </select>
                    </div>
                    <div class="right">
                        <input type="submit" value="Invite"/>
                        <input type="reset" value="Cancel" />
                        <span>Topic* : </span>
                    </div>
                </form>
            </div><!-- panel body ends -->
        </div><!--Panel ends-->


    </div><!-- col-md-4 -->
    <div class="col-md-8">

    <!--INBOX-->
        <div class="panel panel-default rightdiv">
            <div class="panel-heading">
                <span><h3 class="panel-title " >Inbox</h3></span>
                <span class="right"><a href="">View All</a></span>
            </div>

            <div class="panel-body">
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="${resource(dir: "images", file:"person-icon.png")}">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"></h4>
                        <div>${loginUser.firstName} ${loginUser.lastName} @ ${loginUser.username}</div>
                        This is a sample text to be replaced by the data
                    </div><!--media body ends-->

                    <div class="right">
                        <a href="">Download</a>
                        <a href="">View full site</a>
                        <a href="">Mark as read</a>
                        <a href="">View post</a>
                    </div>
                </div>
            </div><!--panel body ends-->
        </div>

        <g:form controller="myMail" action="testAction">
            <g:submitButton name="submit" value="Test Mail"/>
        </g:form>

        <!--share Link-->
    <div class="panel panel-default rightdiv">
        <div class="panel-heading">
            <h3 class="panel-title">Share Link (Pop up)</h3>
        </div>
        <div class="panel-body">
            <form class=loginform>
                <div>
                    <span>Link* : </span>
                    <g:textField name="link"></g:textField>
                </div>
                <div>
                    <span>Description* : </span>
                    <g:textArea name="desc" rows="5" cols="40"/>
                </div>
                <div>
                    <span>Topic* : </span>
                    <select name="topics">
                        <option>Topic 1
                        <option>Topic 2
                        <option>Topic 3
                        <option>Topic 4
                    </select>
                </div>
                <div class="right">
                    <input type="submit" value="Share"/>
                    <input type="reset" value="Cancel" />
                </div>
            </form>
        </div><!-- panel body ends -->
    </div><!--Panel ends-->

        <!-- share document-->
    <div class="panel panel-default rightdiv">
        <div class="panel-heading">
            <h3 class="panel-title">Share Document (Pop up)</h3>
        </div>
        <div class="panel-body">
            <form class="loginform">
                <div>
                    <span>Document* : </span>
                    <g:textField name="link" placeholder="Document"></g:textField>
                    <span><input type="file" name="docFile" ></span>
                </div>
                <div>
                    <span>Description* : </span>
                    <g:textArea name="desc" rows="5" cols="50" placeholder="Description"/>

                </div>
                <div>
                    <span>Topic* : </span>
                    <select name="topics">
                        <option>Topic 1
                        <option>Topic 2
                        <option>Topic 3
                        <option>Topic 4
                    </select>
                </div>
                <div class="right">
                    <input type="submit" value="Share"/>
                    <input type="reset" value="Cancel" />
                </div>
            </form>
        </div><!-- panel body ends -->
    </div><!--Panel ends-->

    <!-- create topic -->
    <div class="panel panel-default rightdiv">
        <div class="panel-heading">
            <h3 class="panel-title">Create Topic (Pop up)</h3>
        </div>
        <div class="panel-body">
            <g:form class="loginform" controller="topic" action="createTopic">
                <div>
                    <span>Name* : </span>
                    <g:textField name="topicName"></g:textField>
                </div>
                <div>
                    <span>Visibility* : </span>
                    <g:select name="topicType" from="${LinkShareEnums.Visibility}"></g:select>

                </div>

                <g:if test="${flash.message}">
                    <div class="message">${flash.message}</div>
                </g:if>

                <div class="right">
                    <g:submitButton name="save" value="Save"/>
                    <g:submitButton name="cancel" value="Cancel"/>
                </div>
            </g:form>
        </div><!-- panel body ends -->
    </div><!--Panel ends-->

</div>
</div>

</body>
</html>