<%@ page import="com.ig.LinkShare.applicationEnums.Visibility; com.ig.LinkShare.applicationEnums.Seriousness" %>
%{--todo move this template to its respective folder--}%

<span class="left">
    %{--${topicID.topicName}--}%
    <g:select name="visbility" class="visibility" from="${com.ig.LinkShare.applicationEnums.Visibility}" data-topic-id="${topicID.id}"/>

    <button type="button" class="btn btn-default editButton" aria-label="Left Align" title="edit">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
    </button>


    <button type="button" class="btn btn-default" aria-label="Left Align" title="trash">
        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
    </button>

</span>
