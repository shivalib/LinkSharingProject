$(document).ready(function () {

    $('#visibility').on('change', function () {
        console.log('hey i m changed!!!!!!!!!!!')
        var changedVal = $(this).val()
        console.log('changed val : ' + changedVal)
        var url = $(this).attr('data-changeVisibility')
        console.log("url :" + url)
        var topicID = $(this).attr('data-topic-id')
        console.log('topic Id : ' + topicID)

        $.ajax({
            url: url,
            data: {
                topicID: topicID,
                visibility: changedVal
            },
            success: function (data) {
                console.log(data)
                if(!data==true){
                    console.log('i m public')
                    $('#visibilitySpan').html(data)
                }
                else
                {
                    console.log('i m private')
                    $('#startDiv').empty()
                }

            }
        })
    });

})

function searchInboxUsingAjax(searchUrl){
    console.log(searchUrl)
    var searchInb=$('#searchInbox').val()
    console.log(searchInb)
    $.ajax({
        url:searchUrl,
        data:{
            searchInbox:searchInb
        },
        success: function (data) {
            console.log(data)
                $('#unreadDiv').html(data)
        }

    })

}
