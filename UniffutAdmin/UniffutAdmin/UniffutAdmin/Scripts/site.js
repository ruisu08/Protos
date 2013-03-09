$(document).ready(function () {
    $(".opcionMenu").hover(
        function () {
            $(this).animate({ backgroundColor: "#9CBCD9"}, "slow");
        },
        function () {
            $(this).animate({ backgroundColor: "#5F6F83"}, "fast");
        }
    );

    $("#contenido a").hover(
        function () {
            $(this).animate({ color: "#9CBCD9" }, "fast");
        },
        function () {
            $(this).animate({ color: "#5F6F83" }, "fast");
        }
    );
    $("#submitBTN").hover(
        function () {
            $(this).animate({ backgroundColor: "#9CBCD9", color: "#5F6F83" }, "fast");
        },
        function () {
            $(this).animate({ backgroundColor: "#5F6F83", color: "#F2F2F2" }, "fast");
        }
    );
});