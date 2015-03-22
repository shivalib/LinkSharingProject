<g:each in="${readingItemListWithIsReadFalse}" var="unreadItem">
    <div class="panel-body" id="inboxPanel">
        <g:render template="/myTemplates/inboxPanelBody" model="[unreadItem: unreadItem]"/>
    </div><!--panel body ends-->
</g:each>