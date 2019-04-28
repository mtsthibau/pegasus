define(['app', 'toastr'], function (app, toastr) {
    'use strict';

    var ctrl = function (apiService) {

        var c = this;
        c.title = 'Pegasus';

        c.novaPostagem = {data: {}};

        c.salvarPostagem = function () {
            if (c.novaPostagem.data.nome == null) {

                toastr.error('Preencha todos os campos obrigatórios!', 'Cadastro - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })
            }
            else {
                //post para o backend
                apiService.post('postagem', c.novaPostagem).then(function (msg) {

                    if (!c.novaPostagem.id) {
                        // adicionar
                        c.postagens.push(msg.data);
                        toastr.success('Postagem cadastrada com sucesso', 'Cadastro - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        });

                        c.postagens[index] = msg.data;
                        c.novaPostagem = {data: {}};
                    }
                    else {
                        // atualizar
                        var index = c.postagens.indexOf(c.novaPostagem);
                        toastr.success('Postagem atualizada com sucesso!', 'Alteração - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        });
                    }
                });
            }
        };

        c.AdicionarInfoPostagem = function (postagem) {
            if (c.novaPostagem.data.title01 == null || c.novaPostagem.data.TextDefinition == null) {

                toastr.error('Preencha todos os campos obrigatórios!', 'Cadastro - ', {
                    positionClass: 'toast-top-center',
                    timeOut: 4000
                })
            }

            else {
                //post para o backend
                apiService.post('postagem', c.novaPostagem).then(function (msg) {


                    if (c.novaPostagem.id) {
                        // adicionar
                        c.postagens.push(msg.data);
                        toastr.success('Informações adicionadas com Sucesso!', 'Adição - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        });

                        c.postagens[index] = msg.data;
                        c.novaPostagem = {data: {}};
                    }

                    else {

                        // atualizar
                        toastr.success('Perfil atualizado com sucesso!', 'Alteração - ', {
                            positionClass: 'toast-top-center',
                            timeOut: 4000
                        });
                        var index = c.postagens.indexOf(c.novaPostagem);
                        c.postagens[index] = msg.data;
                        c.novaPostagem = {data: {}};

                    }

                });
            }
        };

        c.removePostagem = function (postagem) {
            toastr.success('Postagem excluido com Sucesso!', 'Exclusão - ', {
                positionClass: 'toast-top-center',
                timeOut: 4000
            });

            apiService.delete('postagem/' + postagem.id).then(function () {

                var index = c.postagens.indexOf(postagem);
                c.postagens.splice(index, 1);

            });

        };

        c.verPostagem = function (postagem) {
            if (c.verpostagem) {
                c.operacao = "Ver Postagem"
            }
            c.novaPostagem = postagem;
        };

        apiService.get('postagem').then(function (msg) {

            c.postagens = msg.data.rows;
        });

    };

    return app.register.controller('contentAdmRemPostCtrl', ctrl);
});
