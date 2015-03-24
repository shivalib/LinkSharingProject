<div class="right rightdiv">
    %{--<g:link controller="readingItem" action="markAsReadOrUnread"--}%
    %{--params="[currentUser: currentUser, currentResource: currentResource]">Mark as Unread</g:link>--}%

    <a href="javascript:void(0)" class="markReadOrUnread" id="markReadID" data-currentUser="${currentUser}"
       data-currentResource="${currentResource}"
       data_readLink="${createLink(controller: "readingItem", action: "markAsReadOrUnread")}">Mark as Unread</a>
</div>