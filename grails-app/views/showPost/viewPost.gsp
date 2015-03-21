<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="createResourceLayout">

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

                    var id = $(this).attr('data-resourceID')
                    console.log("Rescource id : " + id)

                    $.ajax({
                        url: url,
                        data: {
                            resourceID: id,
                            rating: score
                        },
                        success: function (data) {
                            console.log(data)
                        },
                        error: function (request, status, error) {
                            console.log("We are in error section ");
                            console.log("request :" + request);
                            console.log("status : " + status);
                            console.log("error :" + error);
                        }

                    });
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
            <g:each in="${resourceList}" var="resource">
                <div class="panel-body">
                    <div class="media ">
                        <div class="media-left">
                            <a href="#">
                                <img src="${createLink(controller: "image", action: "renderImage", params: [path: resource.createdBy.photoPath])}"
                                     class="media-object mediaFace">
                            </a>
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading right">
                                <g:link controller="topic" action="index" id="${resource.topic.id}"
                                        params="[loginUser: loginUser.id]">${resource.topic.topicName}</g:link>
                            </h4>

                            <div>
                                <div>
                                    <h4>${resource.createdBy.fullName}</h4>
                                </div>

                                <div>
                                    @${resource.createdBy.username}
                                </div><br>
                            </div>

                            <div>
                                ${resource.description}
                            </div>
                            <ls:checkResourceType resource="${resource}"/>
                            <ls:isAdminOrCreatorOfResource currentUser="${loginUser}" resource="${resource}"/>
                        </div><!--media body ends-->
                    </div><!--media ends -->
                </div><!--panel body ends-->
            </g:each>

        </div><!--panel ends-->
    </div><!--col-md-7 ends-->

%{--<div class="col-md-5">--}%
%{--<ls:checkUser/>--}%
%{--</div>--}%

</div>

</body>
</html>