/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var bloquear = function (id) {

    toastr["error"]("Deseja realmente bloquear o entregador?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onClick='link(" + id + ")'> Sim</button>");
};
var link = function (id) {
    return window.location.href = "/Pegasus/views/bloqEntregador?logica=bloquear&id=" + id;
};

var liberar = function (id) {

    toastr["error"]("Deseja realmente liberar o acesso ao entregador?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onClick='link2(" + id + ")'> Sim</button>");
};
var link2 = function (id) {
    return window.location.href = "/Pegasus/views/bloqEntregador?logica=reativar&id=" + id;
};


jQuery(function ($) {
    $("#celular").mask("(99) 99999-9999");
    $("#telefone").mask("(99) 9999-9999");
    $("#cep").mask("99.999-999");
    $("#cnpj").mask("99.999.999/9999-99");
});


realEntrega = function (postId, entrId) {
    navigator.geolocation.getCurrentPosition(function (position) {
        var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
        };
        var url = "realEntrega?acao=aceitarEntr&id=" + postId + "&idFkEntr=" + entrId + "&latitude=" + pos.lat + "&longitude=" + pos.lng;
        window.location = url;
    });
};



    $(document).ready(function () {

        function limpa_formulário_cep() {
// Limpa valores do formulário de cep.
            $("#logradouro").val("");
            $("#bairro").val("");
            $("#cidade").val("");
            $("#uf").val("");
            $("#ibge").val("");
        }

//Quando o campo cep perde o foco.
        $("#cep").blur(function () {

//Nova variável "cep" somente com dígitos.
            var cep = $(this).val().replace(/\D/g, '');
            //Verifica se campo cep possui valor informado.
            if (cep != "") {

//Expressão regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;
                //Valida o formato do CEP.
                if (validacep.test(cep)) {

//Preenche os campos com "..." enquanto consulta webservice.
                    $("#logradouro").val("carregando...");
                    $("#bairro").val("carregando...");
                    $("#cidade").val("carregando...");
                    $("#estado").val("carregando...");

                    //Consulta o webservice viacep.com.br/
                    $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

                        if (!("erro" in dados)) {
                            //Atualiza os campos com os valores da consulta.
                            $("#logradouro").val(dados.logradouro);
                            $("#bairro").val(dados.bairro);
                            $("#cidade").val(dados.localidade);
                            $("#estado").val(dados.uf);
                        }
                        else {
                            toastr.error("CEP não encontrado.");
                            limpa_formulário_cep();
                        }
                    });
                }
                else {
                    limpa_formulário_cep();
                    toastr.error("Formato de CEP inválido.");
                }
            }
            else {
                limpa_formulário_cep();
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
            