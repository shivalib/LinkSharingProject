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

