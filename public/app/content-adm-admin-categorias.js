/**
 * Created by matheus.thibau on 11/11/2015.
 */
define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';
        c.novaCategoria = {data: {}};


        //post para o backend
        c.salvarCategoria = function () {
            if (c.novaCategoria.data.titulo == null || c.novaCategoria.data.descricao == null) {
                toastr.error('Preencha todos os campos obrigatórios!', 'Cadastro - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })

            }
            else {

                apiService.post('categoria', c.novaCategoria).then(function (msg) {

                    if (!c.novaCategoria.id) {
                        // adicionar
                        toastr.success('Categoria cadastrada com sucesso', 'Cadastro - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        })
                        c.categorias.push(msg.data);
                        c.novaCategoria = {data: {}};

                    }
                    else {

                        // atualizar
                        toastr.success('Categoria atualizada com sucesso', 'Alterações - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        })
                        var index = c.categorias.indexOf(c.novaCategoria);
                        c.categorias[index] = msg.data;
                        c.novaCategoria = {data: {}};
                    }
                });
            }
        };

        c.removeCategoria = function (categoria) {

            apiService.delete('categoria/' + categoria.id).then(function () {

                var index = c.categorias.indexOf(categoria);
                c.categorias.splice(index, 1);

                toastr.success('Categoria ' + categoria.data.titulo + ' excluida com sucesso','Exclusão - ', {positionClass: 'toast-top-center',timeOut: 4000 })
            });

        };

        c.alterarCategoria = function (categoria) {
            c.novaCategoria = categoria;
        };

        apiService.get('categoria').then(function (msg) {

            c.categorias = msg.data.rows;
        });


    };

    return app.register.controller('contentAdminAdminCategoriaCtrl', ctrl);
});
