/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var del= function (id) {

    toastr["error"]("Deseja realmente excluir a escala de peso?<br>\n\
                        <button type='button' class='btn btn-default' \n\
                            onClick='link(" + id + ")'> Sim</button>");
};
var link = function (id) {
    return window.location.href = "/Pegasus/views/delEscala?id=" + id;
};




$(document).ready(function () {
    $('#pesoMin').mask("#9.999", {reverse: true});
    $('#pesoMax').mask("#9.999", {reverse: true});
    $('#preco').mask("#9.99", {reverse: true});
});


$(document).ready(function () {

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
            