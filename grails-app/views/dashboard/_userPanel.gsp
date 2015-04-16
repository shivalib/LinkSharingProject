<div class="media ">
    <div class="media-left">
        <ls:userPhoto currentUser="${loginUser}"/>
    </div>

    <div class="media-body">
        <h4 class="media-heading">
            <secUser:loggedInUserInfo field="fullName"/>
        </h4>

        <div>
            <h5>@<sec:username/></h5>
        </div>

        <div>
            <span class="left leftdiv">
                <g:link controller="subscription" action="showAllSubscriptions">Subscriptions</g:link>
                <div>${loginUser.subscriptions.size()}</div>
            </span>
            <span class="left leftdiv">
                <g:link controller="topic" action="showTopicList">Topics</g:link>
                <div>${loginUser.topics.size()}</div>
            </span>
        </div>
    </div><!--media body ends-->
</div><!--media ends -->
