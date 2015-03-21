<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="loginLayout">

    <!-- raty : rating -->
    <asset:javascript src="jquery.raty.js"/>
    <asset:stylesheet src="jquery.raty.css"/>
    <asset:javascript src="postRating.js"/>

    <script>
        $(document).ready(function () {
            $('#ratyDiv').raty({
                /*score: function () {
                 $(this).data('avg')
                 },*/
                score: 0,
                click: function (score) {
                    console.log(score)
                    var url = "${createLink(controller: "showPost",action: "rateResource")}"
                    console.log(url)
                    var stars = $(this).find("input[name='score']").val();
                    console.log(stars)
                    var id=$(this).attr('data-resourceID')
                    console.log("Rescource id : "+id)
                },
                half: true,
                showHalf: true,
                showCancel: true,
                starHalf: "${resource(dir: "images", file: "star_half.png")}",
                starOff: "${resource(dir: "images", file: "star_off.png")}",
                starOn: "${resource(dir: "images", file: "star_on.png")}",
                noRatedMsg: "Not rated yet !!"

            });
        });
    </script>
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

                    %{--       <div id="ratyDiv" data-starHalf="${resource(dir: "images", file: "star_half.png")}"
                                data-starOff="${resource(dir: "images", file: "star_off.png")}"
                                data-starOn="${resource(dir: "images", file: "star_on.png")}">

                           </div>--}%
                    <div id="ratyDiv" data-resourceID="${topic.resources.id}">

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