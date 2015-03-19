<span class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
        ${loginUser.fullName}
        <span class="caret"/>
    </button>
    <ul class="dropdown-menu mydropdown" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="userProfile" action="index">Profile</g:link></li>

        <li class="divider"></li>

        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Users</a></li>
        <li class="divider"></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Topics</a></li>
        <li class="divider"></li>
        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Posts</a></li>

        <li class="divider"></li>

        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="login" action="logout">Logout</g:link></li>
        %{--<a role="menuitem" tabindex="-1" href="#">Logout</a></li>--}%
    </ul>
</span>