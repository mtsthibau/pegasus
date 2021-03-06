jQuery(function ($) {
    $("#celular").mask("(99) 99999-9999");
    $("#telefone").mask("(99) 9999-9999");
    $("#cep").mask("99.999-999");
    $("#cpf").mask("999.999.999-99");
    $("#cnpj").mask("99.999.999/9999-99");
});

$(document).ready(function () {

    function limpa_formulario_cep() {
// Limpa valores do formulário de cep.
        $("#logradouro").val("");
        $("#complemento").val("");
        $("#numero").val("");
        $("#bairro").val("");
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
                $("#latitude").val("carregando...");
                $("#longitude").val("carregando...");
                $("#ibge").val("carregando...");
                //Consulta o webservice viacep.com.br/
                $.getJSON("//viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

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
                        toastr.error("Digite um CEP válido");
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
    $('#numero').blur(function () {

//tratando endereço para conversão em geoposição
        var cidade = "Belo Horizonte";
        var address = document.getElementById('logradouro').value + ', ' + document.getElementById('bairro').value + ', ' + cidade;
        var geocoder = new google.maps.Geocoder();

        geocoder.geocode({'address': address}, function (results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                var latitudeDest = results[0].geometry.location.lat();
                var longitudeDest = results[0].geometry.location.lng();

                $("#latitude").val(latitudeDest);
                $("#longitude").val(longitudeDest);

                //CHAMADA DE METODO PARA CALCULAR DISTANCIAS
                initMap(latitudeDest, longitudeDest);
            } else {
                toastr.error('Não foi possível calcular sua localização ' + status);
            }
        });
    });
});

function initMap(latitudeDest, longitudeDest) {

    if (latitudeDest == null || longitudeDest == null) {
        return false;
    }
    var logradouro = document.getElementById('logradouro').value;
    var bairro = document.getElementById('bairro').value;
    var numero = document.getElementById('numero').value;
    
    var numeroRem = document.getElementById('numeroRem').value;
    var bairroRem = document.getElementById('bairroRem').value;
    var logradouroRem = document.getElementById('logradouroRem').value;
    console.log(logradouroRem);

    var bounds = new google.maps.LatLngBounds;
    var markersArray = [];

    var origin1 = logradouro + numero + bairro + 'Belo Horizonte, Minas Gerais Brasil';
    var destinationA = logradouroRem + " " + numeroRem + " " + bairroRem + 'Belo Horizonte, Minas Gerais Brasil';
    console.log(destinationA);

    var destinationIcon = 'https://chart.googleapis.com/chart?' +
            'chst=d_map_pin_letter&chld=D|FF0000|000000';
    var originIcon = 'https://chart.googleapis.com/chart?' +
            'chst=d_map_pin_letter&chld=O|FFFF00|000000';
    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: latitudeDest, lng: longitudeDest},
        zoom: 10
    });
    var geocoder = new google.maps.Geocoder;

    var service = new google.maps.DistanceMatrixService;
    service.getDistanceMatrix({
        origins: [origin1],
        destinations: [destinationA],
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
    }, function (response, status) {
        if (status !== google.maps.DistanceMatrixStatus.OK) {
            alert('Error was: ' + status);
        } else {
            var originList = response.originAddresses;
            var destinationList = response.destinationAddresses;
            var outputDiv = document.getElementById('output');
            outputDiv.innerHTML = '';
            deleteMarkers(markersArray);

            var showGeocodedAddressOnMap = function (asDestination) {
                var icon = asDestination ? destinationIcon : originIcon;
                return function (results, status) {
                    if (status === google.maps.GeocoderStatus.OK) {
                        map.fitBounds(bounds.extend(results[0].geometry.location));
                        markersArray.push(new google.maps.Marker({
                            map: map,
                            position: results[0].geometry.location,
                            icon: icon
                        }));
                    } else {
                        alert('Geocode was not successful due to: ' + status);
                    }
                };
            };

            for (var i = 0; i < originList.length; i++) {
                var results = response.rows[i].elements;
                geocoder.geocode({'address': originList[i]},
                showGeocodedAddressOnMap(false));
                for (var j = 0; j < results.length; j++) {
                    geocoder.geocode({'address': destinationList[j]},
                    showGeocodedAddressOnMap(true));
                    outputDiv.innerHTML += results[j].distance.text;

                    var resultado = results[j].distance.text;
                    resultado = resultado.slice(0, 4);
                    $("#output").val(resultado);
                }
            }
        }
    });
}

var del = function (id) {

    toastr["error"]("Deseja realmente excluir seu cadastro?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onClick='link(" + id + ")'> Sim</button>");
};
var link = function (id) {
    return window.location.href = "/Pegasus/views/delRemetente?id=" + id;
};

