var dev = function (id) {

    toastr["error"]("Deseja realmente devolver a entrega?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onClick='link(" + id + ")'> Sim</button>");
};
var link = function (id) {
    return window.location.href = "/Pegasus/views/devolverEntrega?id=" + id;
};


jQuery(function ($) {
    $("#celular").mask("(99) 99999-9999");
    $("#telefone").mask("(99) 9999-9999");
    $("#cep").mask("99.999-999");
    $("#cpf").mask("999.999.999-99");
});


$(document).ready(function () {

    $('#editar').click(function () {
        toastr["error"]("<div><button id='deletar()' class='btn btn-danger'> Deletar Conta</button></div>");
    });

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
});
            