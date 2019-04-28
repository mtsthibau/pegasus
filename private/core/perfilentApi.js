/**
 * Created by matheus on 30/03/2016.
 */
module.exports = function (app) {

    var perfilentRepo = require('./perfilentRepo')(app);

    app.get('/api/perfilent', function (req, res) {

        perfilentRepo.findAndCount().then(function (perfilents) {

            res.send(perfilents);
        });
    });

    app.post('/api/perfilent', function (req, res) {

        var perfilent = req.body;
        if (!perfilent) {
            res.sendStatus(500);
            return;
        }

        perfilentRepo.createOrUpdate(perfilent).then(function (perfilent) {
            res.send(perfilent);
        });

    });

    app.delete('/api/perfilent/:id', function (req, res) {

        var id = req.params.id;
        if (!id) {
            res.sendStatus(500);
            return;
        }

        perfilentRepo.delete(id).then(function (perfilent) {

            res.send(perfilent);
        });
    });
};

