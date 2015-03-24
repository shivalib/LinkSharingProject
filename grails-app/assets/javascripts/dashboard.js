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

    $('.markReadOrUnread').on('click', function () {;
        //_markAsRead->ajax->controller
        var currentUser = $(this).attr('data-currentUser'),
            currentResource = $(this).attr('data-currentResource'), currentPanelBody = $(this).closest('.updateReading'),url=$(this).attr('data_readLink')

        console.log(currentResource, currentUser);

        $.ajax({
            url: url,

            data: {
                currentUser: currentUser,
                currentResource: currentResource
            },
            success: function (data) {
                console.log(data)

                if (data.result && data.isRead)
                    currentPanelBody.empty()
                else if(data.result && !data.isRead)
                    $('#markReadID').html('Mark as Read')

            },
            error: function (request, status, error) {
                console.log("We are in error section ");
                console.log("request :" + request);
                console.log("status : " + status);
                console.log("error :" + error);
            }
        });
    });


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
            $('#unreadDiv').html(data)
        }

    })
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