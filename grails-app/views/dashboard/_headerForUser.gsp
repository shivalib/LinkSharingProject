<span class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
            aria-expanded="true">
        %{--${loginUser.fullName}--}%<sec:username/>
        <span class="caret"/>
    </button>
    <ul class="dropdown-menu mydropdown" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="userProfile" action="index">Profile</g:link></li>

        <li class="divider"/>
        <li role="presentation">
            <g:link role="menuitem" tabindex="-1" controller="logout" action="index">Logout</g:link></li>
    </ul>
</span>