function searchPostUsingAjax(searchPostUrl) {
    console.log(searchPostUrl)
    var searchPost = $('#searchPost').val()
    console.log(searchPost)

    $.ajax({
        url:searchPostUrl,
        data:{
            searchPost:searchPost
        },
        success: function (data) {
                console.log(data)
        }
    })

}




