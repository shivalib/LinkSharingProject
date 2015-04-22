<div class="media ">
    <div class="media-left">
        <ls:userPhoto currentUser="${unreadItem.resource.topic.createdBy}"/>
    </div>

    <div class="media-body">
        <h4 class="media-heading"></h4>

        <div>
            ${unreadItem.resource.topic.createdBy.fullName}@ ${unreadItem.resource.topic.createdBy.username}
        </div>

        <div>
            ${unreadItem.resource.description}
        </div>
    </div><!--media body ends-->

    <div class="right leftdiv">
        <g:link class="right" controller="post" action="index" id="${unreadItem.resource.id}">View post</g:link>
    </div>
    <g:render template="/myTemplates/socialIcons" model="[resourceID:unreadItem.resource.id]"/>

    <ls:checkResourceType resource="${unreadItem.resource}"/>
    <ls:markResource resource="${unreadItem.resource}" ajaxClass="readUnread-inbox" ajaxMethod="${createLink(controller: "readingItem", action: "markAsReadOrUnread")}" currentUser="${loginUser}"/>
</div>