$(document).ready(function () {
    var img = $("#s3slider img");
    var a = $("#s3slider a");
    var p = $("#s3slider p");
    p.remove();
    var largo = a.length;
    for (var i = 0; i < largo; i++) {
        var l = a.eq(i);
        var g = img.eq(i);
        l.append(g);
    }

    $('#s3slider').s3Slider({
        timeOut: 4000
    });


});