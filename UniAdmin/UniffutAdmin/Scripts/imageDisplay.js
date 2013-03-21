$(window).load(function () {
    var img = $(".yoxview img");
    var a = $(".yoxview .imagenAlbum");
    $(".yoxview p").remove();
    var largo = a.length;
    for (var i = 0; i < largo; i++) {
        var h = img.eq(i).attr("src");
        var l = a.eq(i);
        var g = img.eq(i);
        l.attr("href", h);
        l.append(g);
    }


    $(".imagenAlbum img").MyThumbnail({
        thumbWidth: 120,
        thumbHeight: 100,
        backgroundColor: "#ccc",
        imageDivClass: "myPic"
    });

    $(".imagenAlbum").fancybox();
    $(".fancybox-media").fancybox({

        openEffect: 'elastic',
        closeEffect: 'elastic',
        helpers: {
            media: {}
        }
    });
});