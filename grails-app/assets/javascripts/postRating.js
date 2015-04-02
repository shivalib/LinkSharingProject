$(document).ready(function () {


    var avgRate = $('.ratyDiv').attr('data-avg')
    $('.ratyDiv').each(function () {
            $(this).raty({
                score: avgRate,
                click: function (score) {
                    var url = $(this).attr('data-rateLink')
                    var id = $(this).attr('data-resourceID')
                    $.ajax({
                        url: url,
                        data: {
                            resourceID: id,
                            rating: score
                        },
                        success: function (data) {
                            console.log(data)
                        },
                        error: function (request, status, error) {
                            console.log("We are in error section ");
                            console.log("request :" + request);
                            console.log("status : " + status);
                            console.log("error :" + error);
                        }

                    });
                },
                half: true,
                showHalf: true,
                starHalf: '/assets/star_half.png',
                starOn: '/assets/star_on.png',
                starOff: '/assets/star_off.png'
            });
    });
});

