
<g:each in="${userList}" var="user">
    <tr id="updateUsers">
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.active}</td>

        <td class="updateAction">
           <g:render template="/userListing/isActiveOrDeactive" model="[user:user]"/>
        </td>

    </tr>
</g:each>

