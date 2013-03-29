$(document).ready(function () {
    $('.datepicker').datepicker({ dateFormat: "dd/mm/yy" });
    $('[data-confirm]').click(function (e) {
        if (!confirm($(this).attr("data-confirm"))) {
            e.preventDefault();
        }
    });

    

    $('#Equipos').change(function () {
        $.ajaxSetup({ cache: false });
        var selectedItem = $(this).val();
        if (selectedItem == "" || selectedItem == 0) {
            //Do nothing or hide...?
        } else {
            var url = '"~/TablaGoleadoras/refrescar/'+selectedItem+'"'; 
            $.getJSON('<%: ResolveUrl('+url+')%>', function (data) {
                var items = "";
                $.each(data, function (i, data) {
                    items += "<option value='" + data.idJugadora + "'>" + data.nombre + "</option>";
                });
                $("#Jugadoras").html(items);
                //$("#Jugadoras").removeAttr('disabled');
            });
        }
    });

    $("#validateForm").validator();

});
