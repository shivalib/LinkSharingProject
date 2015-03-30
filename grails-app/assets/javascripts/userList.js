$(document).ready(function () {
    $('#selectType').on('change', function () {
        var selectVal = $('#selectType').val()
        console.log(selectVal)

        var url = $(this).attr('data-changeUser')
        console.log(url)
        $.ajax({
            url: url,
            data: {
                selectVal: selectVal
            },
            success: function (data) {
                console.log(data)
                $('.updateUsers').html(data)
            }

        })
    });

    $('.manage').on('click', function () {
        var url = $(this).attr('data-manageAction')
        var userID = $(this).attr('ajax-id')
        var closestTD = $(this).closest('.updateAction')
        $.ajax({
            url: url,
            data: {
                userID: userID
            },
            success: function (data) {
                console.log('user deactivation or activation : ' + data)
                console.log($(this))

                //console.log(closestTD)
                closestTD.html(data)

            },
            failure: function (data) {
                console.log('user deactivation or activation : ' + data)
            }

        })
    });
});

function searchUserUsingAjax(searchUserUrl) {
    var searchUserText = $('#searchUser').val()
    $.ajax({
        url: searchUserUrl,
        data: {
            searchUserValue: searchUserText
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