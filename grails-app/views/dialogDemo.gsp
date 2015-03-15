<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 16/3/15
  Time: 12:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- jquery-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    %{--<asset:javascript src="jquery-2.1.3.js"/>--}%
    <asset:javascript src="jquery-ui.js"/>

    <asset:stylesheet src="jquery-ui.css"/>

    <asset:stylesheet src="jquery-ui.theme.css"/>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- Self-created CSS -->
    <link rel="stylesheet" href="${resource(dir: "css",file:"LinkShare.css" )}">
</head>

<body>
<div id="dialogPlaceholder"></div>
<button id="trigger_btn" value="open popup">open Popup</button>

</body>
</html>