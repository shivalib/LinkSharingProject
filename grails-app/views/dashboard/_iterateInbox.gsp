<g:if test="${readingItemListWithIsReadFalse}">
    <g:each in="${readingItemListWithIsReadFalse}" var="unreadItem">
        <div class="panel-body updateReadingItem">
            <g:render template="/myTemplates/inboxPanelBody" model="[unreadItem: unreadItem]"/>
        </div><!--panel body ends-->
    </g:each>
%{--<util:remotePaginate controller="home" action="paginateInbox" max="${max}" offset="${offset}" total="${totalInboxItems}"--}%
%{--update="inboxDiv"/>--}%
</g:if>
<g:else>
    <div class="leftdiv">
        <h4>No unread items yet!</h4>
    </div>
</g:else>
