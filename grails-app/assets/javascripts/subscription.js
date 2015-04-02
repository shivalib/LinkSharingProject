function searchTopicUsingAjax(searchUrl) {
    var searchTextBox = $('#searchText').val()
    $.ajax({
        url: searchUrl,
        data: {
            searchText: searchTextBox
        },
        success: function (data) {
            console.log(data)
            $('#updateSearchResult').html(data)
        },
        error: function (request, status, error) {
            console.log("We are in error section ");
            console.log("request :" + request);
            console.log("status : " + status);
            console.log("error :" + error);
        }
    })
}


$(document).ready(function () {
    $('.topicLink').on('click', function () {
        console.log($(this).attr('data-ajax-searchPost'))
        var ajaxId = $(this).attr('ajax-id')
        console.log(ajaxId)

        $.ajax({
            url: $(this).attr('data-ajax-searchPost'),
            data: {
                topicID: ajaxId
            },
            success: function (data) {
                console.log(data)
                $('#updatePost').html(data)
            },
            error: function (request, status, error) {
                console.log("We are in error section ");
                console.log("request :" + request);
                console.log("status : " + status);
                console.log("error :" + error);
            }

        })
    })
})

