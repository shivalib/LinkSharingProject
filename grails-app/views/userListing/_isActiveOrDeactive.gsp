<g:if test="${user.active}">
    <a href="javascript:void(0)" class="manage"
       data-manageAction="${createLink(controller: "user", action: "activateOrDeactivateUser")}"
       ajax-id="${user.id}">Deactivate</a>
</g:if>
<g:else>
    <a href="javascript:void(0)"
       data-manageAction="${createLink(controller: "user", action: "activateOrDeactivateUser")}"
       class="manage" ajax-id="${user.id}">Activate</a>
</g:else>