<g:each in="${readingItemListWithIsReadFalse}" var="unreadItem">
    <div class="panel-body updateReading" >
        <g:render template="/myTemplates/inboxPanelBody" model="[unreadItem: unreadItem]"/>
    </div><!--panel body ends-->
</g:each>

<util:remotePaginate controller="home" action="paginateInbox" total="${inboxCount}" max="${max}"
                     offset="${offset}" update="inboxDiv"/>