<div class="media ">
    <div class="media-left">
        <a href="#">
            <g:img class="media-object mediaFace" dir="images" file="person-icon.png" alt="Person"></g:img>
        </a>
    </div>
    <div class="media-body">
        <h4 class="media-heading">
            <h5>${topics.topicName}</h5>

        </h4>
        <div>
            <h5>@${loginUser.username}</h5>
        </div>
        <span class="right">Posts
            <div>${topics.resources.size()}</div>
        </span>

        <span class="right rightdiv">Subscriptions
            <div>${topics.subscriptions.size()}</div>
        </span>
        %{--<div>--}%
        <br><br>
        <span>
            <g:select name="seriousness" from="${LinkShareEnums.Seriousness}"/>
            <g:select name="visibility" from="${LinkShareEnums.Visibility}"/>

            <button type="button" class="btn btn-default" title="Send invitation">
                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
            </button>

            <button type="button" class="btn btn-default" aria-label="Left Align" title="trash">
            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </button>

            <button type="button" class="btn btn-default" aria-label="Left Align" title="edit">
            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
            </button>
            
        </span>

        %{--</div>--}%
    </div><!--media body ends-->
</div><!--media ends -->
