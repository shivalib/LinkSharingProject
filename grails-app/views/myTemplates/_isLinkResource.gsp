<%@ page import="com.ig.LinkShare.LinkResource" %>

%{--<g:if test="${resource}">--}%
    %{--<%--}%
%{--//        var id=${resource.id }--}%
        %{--com.ig.LinkShare.LinkResource linkResource=LinkResource.findWhere(id: resource.id)--}%
    %{--%>--}%
%{--</g:if>--}%

<div class="right">
    %{--${linkResource.linkUrl}--}%
    <a href="${linkResource.linkUrl}" target="_blank">View full site</a>
    %{--<g:link  target="_blank">View full site</g:link>--}%
</div>