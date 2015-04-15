<g:each in="${readingItemListWithIsReadFalse}" var="unreadItem">
    <div class="panel-body updateReadingItem" >
        <g:render template="/myTemplates/inboxPanelBody" model="[unreadItem: unreadItem]"/>
    </div><!--panel body ends-->
</g:each>

