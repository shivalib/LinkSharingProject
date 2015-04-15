<span class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
            aria-expanded="true">
        <sec:username/>
        <span class="caret"/>
    </button>
    <ul class="dropdown-menu mydropdown" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="userProfile" action="index">Profile</g:link></li>

        <li class="divider"></li>

        <li role="presentation">

            <g:link role="menuitem" tabindex="-1" controller="user" action="list">Users</g:link>

        </li>
        <li class="divider"></li>
        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="subscription"
                    action="showAllSubscriptions">Topics</g:link>
        </li>
        <li class="divider"></li>

        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="showPost" action="postsForAdmin" >Posts</g:link>
        </li>

        <li class="divider"></li>

        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="login" action="logout">Logout</g:link></li>
        %{--<a role="menuitem" tabindex="-1" href="#">Logout</a></li>--}%
    </ul>
</span>