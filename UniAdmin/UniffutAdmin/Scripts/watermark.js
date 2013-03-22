$(document).ready(function () {

    var watermarkBoxOne = $("#searchBoxOne").val();
    var watermarkBoxTwo = $("#searchBoxTwo").val();
    //init, set watermark text and class
    $('#searchBoxOne').val(watermarkBoxOne).addClass('waterMark');
    $('#searchBoxTwo').val(watermarkBoxTwo).addClass('waterMark');

    //if blur and no value inside, set watermark text and class again.
    $('#searchBoxOne').blur(function () {
        if ($(this).val().length == 0) {
            $(this).val(watermarkBoxOne).addClass('waterMark');
        }
    });

    $('#searchBoxTwo').blur(function () {
        if ($(this).val().length == 0) {
            $(this).val(watermarkBoxTwo).addClass('waterMark');
        }
    });

    //if focus and text is watermrk, set it to empty and remove the watermark class
    $('#searchBoxOne').focus(function () {
        if ($(this).val() == watermarkBoxOne) {
            $(this).val('').removeClass('waterMark');
        }
    });

    $('#searchBoxTwo').focus(function () {
        if ($(this).val() == watermarkBoxTwo) {
            $(this).val('').removeClass('waterMark');
        }
    });
});