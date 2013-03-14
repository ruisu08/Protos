$(document).ready(function () {





   $(".opcionMenu").click(function () {
        $(".contenidoOpcion").slideUp('normal');
        $(".opcionMenu").removeClass("desplegado");
        if($(this).next().is(':hidden') == true) {
            $(this).addClass("desplegado");
			$(this).next().slideDown('normal');
		 } 
    });

    $(".contenidoOpcion").hide();
    

});