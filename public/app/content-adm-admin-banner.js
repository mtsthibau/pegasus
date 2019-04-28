define(['app', 'toastr'], function (app, toastr) {
    'use strict';
    '$location';

    var ctrl = function (apiService, $location) {

        var c = this;
        c.title = 'Pegasus';
        c.required = ' * ';
        c.novoBanner = {data: {}};

        c.salvarBanner = function () {

            if (c.novoBanner.data.banner == null || c.novoBanner.data.titulo == null || c.novoBanner.data.descricao == null) {
                toastr.error('Preencha todos os campos obrigatórios!','Cadastro - ', {positionClass: 'toast-top-center',timeOut: 4000})
            }
            else {
                //post para o backend
                apiService.post('banner', c.novoBanner).then(function (msg) {
                    //Validação - Campos foram totalmente preenchidos?????

                    if (!c.novoBanner.id) {
                        // adicionar
                        toastr.success('Banner cadastrado com sucesso','Cadastro - ', {positionClass: 'toast-top-center',timeOut: 4000})

                        c.banners.push(msg.data);
                            c.novoBanner = {data: {}};
                    }
                    else {

                        // atualizar
                        toastr.success('Banner alterado com sucesso','Alterações - ', {positionClass: 'toast-top-center',timeOut: 4000 })
                        var index = c.banners.indexOf(c.novoBanner);
                        c.banners[index] = msg.data;
                        c.novoBanner = {data: {}};

                    }

                });

            }

        };

        c.removeBanner = function (banner) {

            apiService.delete('banner/' + banner.id).then(function () {
                var index = c.banners.indexOf(banner);
                c.banners.splice(index, 1);
                toastr.success('Banner ' + banner.data.titulo + ' excluido com sucesso','Exclusão - ', {positionClass: 'toast-top-center',timeOut: 4000 })
            });

        };

        c.alterarBanner = function (banner) {

            c.novoBanner = banner;
        };

        apiService.get('banner').then(function (msg) {

            c.banners = msg.data.rows;
        });
    };

    return app.register.controller('contentAdminAdminBannerCtrl', ctrl);
});
