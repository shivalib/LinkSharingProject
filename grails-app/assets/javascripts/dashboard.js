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

            }
        })
    });

    //alert("hello")
    //var abc=$('#visibility').val()
    //alert(abc)

})
