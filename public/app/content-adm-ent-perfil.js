/**
 * Created by matheus.thibau on 11/11/2015.
 */
define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';
        c.novoPerfil = {data: {}};

        c.salvarPerfil = function () {
            if (c.novoPerfil.data.nome == null || c.novoPerfil.data.sobrenome == null || c.novoPerfil.data.email == null) {

                toastr.error('Preencha todos os campos obrigatórios!', 'Cadastro - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })

            }
            else {
                apiService.post('perfilent', c.novoPerfil).then(function (msg) {
                    if (!c.novoPerfil.id) {
                        // adicionar
                        c.perfis.push(msg.data);
                        toastr.success('Perfil cadastrado com sucesso', 'Cadastro - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        })

                        c.perfis[index] = msg.data;
                        c.novoPerfil = {data: {}};
                    }
                    else {

                        // atualizar

                        toastr.success('Perfil atualizado com sucesso!', 'Alteração - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        })
                        var index = c.perfis.indexOf(c.novoPerfil);
                        c.perfis[index] = msg.data;
                        c.novoPerfil = {data: {}};

                    }

                });
            }
        };

        c.removePerfil = function (perfil) {

            apiService.delete('perfilent/' + perfil.id).then(function () {
                toastr.success('Perfil ' + perfil.data.sobrenome + ' removido com sucesso!', 'Exclusão - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })

                var index = c.perfis.indexOf(perfil);
                c.perfis.splice(index, 1);


            });

        };

        c.alterarPerfil = function (perfil) {
            //alterar chamada do modal para edição
            c.novoPerfil = perfil;
        };

        apiService.get('perfilent').then(function (msg) {

            c.perfis = msg.data.rows;
        });

    };

    return app.register.controller('contentAdmEntPerfilCtrl', ctrl);
});
