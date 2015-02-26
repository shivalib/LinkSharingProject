<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 25/2/15
  Time: 9:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
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
                <div class="media ">
                    <div class="media-left">
                        <a href="#">
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Shivali Batra</h4>
                        This is a sample text to be replaced by the data
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
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
                        This is a sample text to be replaced by the data
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
                    </div><!--media body ends-->
                </div><!--media ends-->
            </div><!--panel body ends-->
        </div><!--panel ends -->

    <!-- Send Invitation -->
        <div class="panel panel-default leftdiv">
            <div class="panel-heading">
                <h3 class="panel-title">Send invitation (Pop up)</h3>
            </div>
            <div class="panel-body">
                <form class=loginform>
                    <div>
                        <span>Email* : </span>
                        <input type="text"></input>
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
                        <input type="submit" value="Invite"/>
                        <input type="reset" value="Cancel" />
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
                            <img class="media-object mediaFace" src="../images/person-icon.png" alt="Person">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="">Grails</a></h4>
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
    </div>
</div>

</body>
</html>