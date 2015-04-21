
<div class="media updateReadUnread ">
    <div class="media-left">
        <ls:userPhoto currentUser="${resources.topic.createdBy}"/>

    </div>

    <div class="media-body">
        <h4 class="media-heading"></h4>

        <div>
            ${resources.topic.createdBy.fullName}@${resources.topic.createdBy.username}
        </div>

        <div>
            ${resources.description}
        </div>
    </div><!--media body ends-->

    <div class="right leftdiv">
        <g:link class="right" controller="showPost" action="index" id="${resources.id}">View post</g:link>
    </div>
    <g:render template="/myTemplates/socialIcons" model="[resourceID: resources.id]"/>
    <ls:checkResourceType resource="${resources}"/>
    <ls:markResource resource="${resources}" ajaxClass="readUnread-postOnClickOfTopicName"
                     ajaxMethod="${createLink(controller: "readingItem", action: "markAsReadOrUnreadForTopicClick")}"
                     currentUser="${loginUser}"/>
</div>