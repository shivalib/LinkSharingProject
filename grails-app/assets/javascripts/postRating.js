/**
 * Created by intelligrape on 20/3/15.
 */

$(document).ready(function () {
    $('#ratyDiv').raty({
        score: function () {
            $(this).data('avg')
        },
        half: true,
        showHalf: true,
        starHalf: $(this).attr('data-starHalf'),
        starOn: $(this).attr(' data-starOn'),
        starOff: $(this).attr(' data-starOff')
    });
});

//path:'/assets/images/star_on',
//size:24,
//scoreName:'star',
//click: function (score,evt) {
//
//}

//})