/**
 * Created by matheus.thibau on 18/11/2015.
 */
module.exports = function (app) {

    var destaqueRepo = require('./destaqueRepo')(app);

    app.get('/api/destaque', function (req, res) {

        destaqueRepo.findAndCount().then(function (destaques) {

            res.send(destaques);
        });
    });

    app.post('/api/destaque', function (req, res) {

        var destaque = req.body;
        if (!destaque) {
            res.sendStatus(500);
            return;
        }

        destaqueRepo.createOrUpdate(destaque).then(function (destaque) {
            res.send(destaque);
        });

    });

    app.delete('/api/destaque/:id', function (req, res) {

        var id = req.params.id;
        if (!id) {
            res.sendStatus(500);
            return;
        }

        destaqueRepo.delete(id).then(function (destaque) {

            res.send(destaque);
        });
    });
};