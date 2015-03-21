
<table class="table table-bordered table-responsive">
<tr>
    <th>ID</th>
    <th>Username</th>
    <th>Email</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Active</th>
    <th>Manage</th>
</tr>
<g:each in="${userList}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.active}</td>

        <g:render template="/showPost/tagManage" model="[user: user]"/>
    </tr>
</g:each>
</table>