<script>
    $('.readUnread-postOnClickOfTopicName').on('click', function () {
        var currentPanelBody = $(this).closest('.updateReadUnread')
        var currentUser = $(this).attr('data-currentUser'),
                currentResource = $(this).attr('data-currentResource'), url = $(this).attr('data_readLink')
        $.ajax(
                {
                    url: url,
                    data: {
                        currentUser: currentUser,
                        currentResource: currentResource
                    },
                    success: function (data) {
                        console.log(data)
                        currentPanelBody.html(data)
                    },
                    error: function (request, status, error) {
                        console.log("We are in error section ");
                        console.log("request :" + request);
                        console.log("status : " + status);
                        console.log("error :" + error);
                    }
                }
        )

    })
</script>
<g:each in="${resourceList}" var="resources">

    <g:render template="/subscription/markReadOrUnreadOnTopicClick" model="[resources: resources]"/>

</g:each>