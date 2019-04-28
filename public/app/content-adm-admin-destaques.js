/**
 * Created by matheus.thibau on 18/11/2015.
 */
define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';
        c.novoDestaque = {data: {}};


        c.salvarDestaque = function () {
            if (c.novoDestaque.data.foto == null || c.novoDestaque.data.nome == null) {
                toastr.error('Preencha todos os campos obrigatórios!', 'Cadastro - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })
            }
            else {
                //post para o backend
                apiService.post('destaque', c.novoDestaque).then(function (msg) {

                    if (!c.novoDestaque.id) {
                        // adicionar
                        toastr.success('Destaque cadastrado com sucesso', 'Cadastro - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        })
                        c.destaques.push(msg.data);
                        c.novoDestaque = {data: {}};
                    }
                    else {
                        // atualizar
                        toastr.success('Destaque alterado com sucesso', 'Alterações - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        })
                        var index = c.destaques.indexOf(c.novoDestaque);
                        c.destaques[index] = msg.data;
                        c.novoDestaque = {data: {}};
                    }
                    ;
                });
            }
            ;

        };


        c.removeDestaque = function (destaque) {


            apiService.delete('destaque/' + destaque.id).then(function () {
                toastr.success('Destaque ' + destaque.data.nome + ' excluido com sucesso', 'Exclusão - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })
                var index = c.destaques.indexOf(destaque);
                c.destaques.splice(index, 1);
            });

        };

        c.alterarDestaque = function (destaque) {

            c.novoDestaque = destaque;
        };

        apiService.get('destaque').then(function (msg) {

            c.destaques = msg.data.rows;
        });
    };

    return app.register.controller('contentAdmAdminDestaqueCtrl', ctrl);
});
