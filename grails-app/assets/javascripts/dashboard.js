$(document).ready(function () {

    $('.topicVisibility').on('change', function () {
        var changedVal = $(this).val()
        var url = $(this).attr('data-changeVisibility')
        var topicID = $(this).attr('data-topic-id')
        $.ajax({
            url: url,
            data: {
                topicID: topicID,
                visibility: changedVal
            },
            success: function (data) {
                console.log(data)
                if (!data) {
                    $('#visibilitySpan').html(data)
                }
                else {
                    $('#startDiv').empty()
                }
            }
        })
    });


    $('.readUnread-inbox').on('click', function () {
        //_markAsRead->ajax->controller
        var currentPanelBody = $(this).closest('.updateReadingItem')
        var element=$(this);

           var successHandler= function(data) {
                console.log(data);
                currentPanelBody.empty()
            }

        markAsReadUnread(successHandler,element)

    });

    $('.readUnread-post').on('click', function () {
        //alert('hello')
        //_markAsRead->ajax->controller
        var currentPanelBody = $(this).closest('.updateReadingItem')
        var element=$(this)

        var successHandler= function(data) {
            console.log(data)
            currentPanelBody.html(data)
        }

        markAsReadUnread(successHandler,element)

    });

    function markAsReadUnread(successHandler,element){
        var currentUser = element.attr('data-currentUser'),
            currentResource = element.attr('data-currentResource'),url=element.attr('data_readLink')

        $.ajax(
            {
                url:url,
                data: {
                    currentUser: currentUser,
                    currentResource: currentResource
                },
                success:successHandler,
                error: function (request, status, error) {
                    console.log("We are in error section ");
                    console.log("request :" + request);
                    console.log("status : " + status);
                    console.log("error :" + error);
                }
            }
        )

    }

    $('.subscribeSeriousness').on('change', function () {

        var changedVal = $(this).val()
        var url = $(this).attr('data-changeSerious')
        var subscribeID = $(this).attr('id')

        $.ajax({
            url: url,
            data: {
                subscribeID: subscribeID,
                seriousness: changedVal
            },
            success: function (data) {
                console.log(data)
            }
        })
    });

})

function searchInboxUsingAjax(searchUrl) {
    console.log(searchUrl)
    var searchInb = $('#searchInbox').val()
    console.log(searchInb)
    $.ajax({
        url: searchUrl,
        data: {
            searchInbox: searchInb
        },
        success: function (data) {
            console.log(data)
            $('#inboxDiv').html(data)
        }

    })
}

function searchPostUsingAjax(searchPostUrl){

}

function searchAllPagesUsingAjax(searchAllUrl, searchPageUrl) {
    console.log(searchAllUrl)
    var textToSearch = $('#searchGlobal').val()
    console.log(textToSearch)

    $.ajax({
        url: searchAllUrl,
        data: {
            textToSearch: textToSearch
        },
        success: function (data) {
            console.log(data)
            $('.addSearchData').html(data)
        }

    })

}