/**
 * Created by intelligrape on 19/3/15.
 */

function searchTopicUsingAjax(searchUrl){
    var searchTextBox=$('#searchText').val()
    console.log(searchTextBox)
    $.ajax({
        url:searchUrl,
        data:{
            searchText:searchTextBox
        },
        success: function (data) {
            console.log(data)
            $('#updateSearchResult').html(data)
            //if(!data.result) {
            //    $('#updateSearchResult').empty()
            //}
            //else
            //{
            //    $('#updateSearchResult').html('tadaaaaaaaaaaaaaaaaaaan')
            //}
        },
        error: function (request, status, error) {
            console.log("We are in error section ");
            console.log("request :" + request);
            console.log("status : " + status);
            console.log("error :" + error);
        }
    })
}
