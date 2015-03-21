
//$("#selectType").on('change', function () {
//    //console.log('hello')
//    //alert('abc');
//    $.ajax({
//        url:$(this).attr('data-changeUser'),
//        success: function (data) {
//            console.log(data),
//            console.log(url)
//        }
//    })
//});
//

$(document).ready(function () {
    $('#selectType').on('change', function () {
        var selectVal=$('#selectType').val()
        //console.log($('#selectType').val())
        $.ajax({
            url:$(this).attr('data-changeUser'),
            data:{
              selectVal:selectVal
            },
            success: function (data) {
                console.log(data)
            }

        })
    });

    $('.manage').on('click', function () {
        //alert("i m clicked")
        var url=$(this).attr('data-manageAction')
        var userID=$(this).attr('ajax-id')
        //alert(userID)
        //alert(url)
        $.ajax({
            url:url,
            data:{
                userID:userID
            },
            success: function (data) {
                alert('user deactivation : '+data)
            },
            failure: function (data) {
                alert('user deactivation : '+data)
            }

        })
    });
});

function searchUserUsingAjax(searchUserUrl){
    //console.log(searchUserUrl)
    var searchUserText=$('#searchUser').val()
    //console.log(searchUserText)
    $.ajax({
        url:searchUserUrl,
        data:{
            searchUserValue:searchUserText
        },
        success: function (data) {
            console.log(data)
            $('.updateUsers').html(data)
        },
        error: function (request, status, error) {
            console.log("We are in error section ");
            console.log("request :" + request);
            console.log("status : " + status);
            console.log("error :" + error);
        }
    })

}