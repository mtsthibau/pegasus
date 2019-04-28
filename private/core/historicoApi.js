module.exports = function (app) {

    var historicoRepo = require('./historicoRepo')(app);

    app.get('/api/historico', function (req, res) {

        historicoRepo.findAndCount().then(function (historicos) {

            res.send(historicos);
        });
    });

    app.post('/api/historico', function (req, res) {

        var historico = req.body;
        if (!historico) {
            res.sendStatus(500);
            return;
        }

        historicoRepo.createOrUpdate(historico).then(function (historico) {
            res.send(historico);
        });

    });

    app.delete('/api/historico/:id', function (req, res) {

        var id = req.params.id;
        if (!id) {
            res.sendStatus(500);
            return;
        }

        historicoRepo.delete(id).then(function (historico) {

            res.send(historico);
        });
    });
};

/**
 * Created by matheus on 30/03/2016.
 */
