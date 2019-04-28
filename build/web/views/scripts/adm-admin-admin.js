var delAdmin = function (idAdmin) {

    toastr["error"]("Deseja realmente excluir o administrador?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onClick='link(" + idAdmin + ")'> Sim</button>");
};
var link = function (idAdmin) {
    return window.location.href = "/Pegasus/views/delAdministrador?id=" + idAdmin;
};



jQuery(function ($) {
    $("#celular").mask("(99) 99999-9999");
    $("#telefone").mask("(99) 9999-9999");
    $("#cep").mask("99.999-999");
    $("#cpf").mask("999.999.999-99");
});

$(document).ready(function () {
    $('#myTable').DataTable({
        select: true,
        lengthChange: false,
        "language": {
            "emptyTable": "Nenhum registro encontrado",
            "info": "",
            "infoEmpty": "Exibindo 0 de 0 registros",
            "infoFiltered": "",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Exibindo MENU Registros",
            "loadingRecords": "Carregando...",
            "processing": "Processando...",
            "search": "Buscar:",
            "zeroRecords": "Não foi possível localizar sua busca",
            "decimal": ",",
            "thousands": ".",
                    "paginate": {
                        "first": "Primeira",
                        "last": "Última",
                        "next": " >",
                        "previous": "<"
                    },
            "aria": {
                "sortAscending": ": Classificação ascedente",
                "sortDescending": ": Classificação Descendente"
            }

        }
    });
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
            