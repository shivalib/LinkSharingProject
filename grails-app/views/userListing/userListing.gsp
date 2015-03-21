<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="dashboardLayout"/>
    <asset:javascript src="userList.js"/>

</head>

<body>
<table class="table table-bordered table-responsive">
    <tr>
        <td colspan="7">
            Users
            <div class="right">

                <input type="text" id="searchUser"
                       placeholder="Search"
                       onkeyup="searchUserUsingAjax('${createLink(controller: "search",action: "searchUser")}')"/>

                <g:select name="userType" id="selectType"
                          data-changeUser="${createLink(controller: "user", action: "changeUserList")}"
                          from="['Active', 'Inactive', 'All Users']" value="All Users"/>

            </div>

        </td>
    </tr>
</table>
<div class="updateUsers">
    <g:render template="/userListing/userEntry" model="[userList: userList]"/>
</div>
</body>
</html>