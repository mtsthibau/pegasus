define(['app'], function (app) {
    'use strict';

    var ctrl = function () {

        var c = this;

        c.items = [
            {
                href: 'process',
                name: 'Processos',
                desc: 'Crie e gerencie os modelos de processos e tarefas da aplicação',
                favorite: false,
                favClass: 'fa-star-o'
            },
            {
                href: 'model',
                name: 'Modelos',
                desc: 'Crie e gerencie os modelos de documentos da aplicação',
                favorite: false,
                favClass: 'fa-star-o'
            },
            {
                href: 'layout',
                name: 'Leiautes',
                desc: 'Crie e gerencie os modelos de relatórios para obtenção de informações operacionais e estratégicas',
                favorite: false,
                favClass: 'fa-star-o'
            }
        ];
    };

    return app.register.controller('configCtrl', ctrl);
});