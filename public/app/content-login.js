/**
 * Created by matheus.thibau on 11/11/2015.
 */

define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.tituloPagina = 'Autentica��o';
        c.btnCadastrar = 'Cadastre';
        c.inputSenha = 'Senha ';
        c.inputSenhaConf = 'Confirma��o de senha ';
        c.inputEmail = 'E-mail ';
        c.obs = 'Para recuperar sua senha ou login, clique aqui !';
        c.btnSalvar = 'Entrar';
        c.btnLimpar = 'Limpar';
        c.btnCancelar = 'Cancelar';
        c.legenda = ' Campos obrigat�rios';
        c.required = ' * ';
        c.novaSenha = {data: {}};

        //c.salvarSenha = function () {
        //    if (!c.novaSenha.data.email || !c.novaSenha.data.senha || !c.novaSenha.data.senhaConf) {
        //
        //        toastr.error('Preencha todos os campos obrigat�rios!', 'Cadastro - ', {
        //            positionClass: 'toast-top-center',
        //            timeOut: 4000,
        //            closeButton: 'true',
        //        })
        //
        //    } else if (c.novaSenha.data.senha != c.novaSenha.data.senhaConf) {
        //        toastr.error('Suas senhas n�o conferem, tente novamente.', 'Cadastro - ', {
        //            positionClass: 'toast-top-center',
        //            timeOut: 4000
        //        })
        //    } else if (c.novaSenha.data.senha.length <= 7) {
        //        toastr.error('Sua senha � curta de mais, ela deve conter no minimo 8 digitos.', 'Cadastro - ', {
        //            positionClass: 'toast-top-center',
        //            timeOut: 4000
        //        })
        //    }
        //    //else if (c.perfis.data.email != c.novaSenha.data.email) {
        //    //    toastr.error('Usu�rio n�o encontrado!', 'Cadastro - ', {
        //    //        positionClass: 'toast-top-center',
        //    //        timeOut: 4000
        //    //    })
        //
        //    //}
        //    else {
        //
        //        apiService.post('perfil', c.novaSenha).then(function (msg) {
        //
        //            toastr.success('Senha cadastrada!', 'Cadastro - ', {
        //                positionClass: 'toast-top-center',
        //                timeOut: 4000
        //            })
        //
        //            // Cadastrar apenhas Senha
        //
        //            var index = c.perfis.indexOf(c.novaSenha);
        //            c.perfis[index] = msg.data;
        //            c.novaSenha = {data: {}};
        //
        //
        //        });
        //    }
        //
        //}

        //apiService.get('perfil').then(function (msg) {
        //    c.perfis = msg.data.rows;
        //
        //});

    };
    return app.register.controller('contentLogin', ctrl);
})
;
