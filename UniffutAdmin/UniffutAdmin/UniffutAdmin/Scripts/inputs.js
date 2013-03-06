$(document).ready(function () {
    $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
    $('[data-confirm]').click(function (e) {
        if (!confirm($(this).attr("data-confirm"))) {
            e.preventDefault();
        }
    });
});
