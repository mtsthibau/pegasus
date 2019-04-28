/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

jQuery(function($) {
    $("#telefone").mask("(99) 9999-9999");
    $("#celular").mask("(99) 99999-9999");
//    $("#peso").mask("99,999");
//    $("#altura").mask("99,99");
//    $("#largura").mask("99,99");
//    $("#profundidade").mask("99,99");
    $("#cep").mask("99.999-999");
    $("#cpf").mask("999.999.999-99");
});

$(document).ready(function() {

    function limpa_formulario_cep() {
// Limpa valores do formulário de cep.
        $("#rua").val("");
        $("#bairro").val("");
        $("#cidade").val("");
        $("#uf").val("");
        $("#ibge").val("");
    }

//Quando o campo cep perde o foco.
    $("#cep").blur(function() {

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
                $("#latitude").val("carregando...");
                $("#longitude").val("carregando...");
                $("#ibge").val("carregando...");
                //Consulta o webservice viacep.com.br/
                $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function(dados) {

                    if (!("erro" in dados)) {
                        //Atualiza os campos com os valores da consulta.
                        $("#logradouro").val(dados.logradouro);
                        $("#bairro").val(dados.bairro);
                        $("#cidade").val(dados.localidade);
                        $("#uf").val(dados.uf);
                        $("#latitude").val(dados.latitude);
                        $("#longitude").val(dados.longitude);

                    }
                    else {
                        toastr.error("CEP não encontrado.");
                        limpa_formulario_cep();
                    }
                });
            }
            else {
                limpa_formulario_cep();
                toastr.error("Formato de CEP inválido.");
            }
        }
        else {
            limpa_formulario_cep();
        }
    });
});


$(document).ready(function() {
    $('#numero').blur(function() {

//tratando endereço para conversão em geoposição
        var cidade = "Belo Horizonte";
        var address = document.getElementById('logradouro').value + ', ' + document.getElementById('bairro').value + ', ' + cidade;
        var geocoder = new google.maps.Geocoder();

        geocoder.geocode({'address': address}, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                var latitudeDest = results[0].geometry.location.lat();
                var longitudeDest = results[0].geometry.location.lng();

                $("#latitude").val(latitudeDest);
                $("#longitude").val(longitudeDest);

                //CHAMADA DE METODO PARA CALCULAR DISTANCIAS
                initMap(latitudeDest, longitudeDest);
            } else {
                toastr.error('Google maps não conseguiu obter sua localização: ERRO' + status);
            }
        });
    });
});
