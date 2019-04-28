module.exports = function (app) {

    var categoriaRepo = require('./categoriaRepo')(app);

    app.get('/api/categoria', function (req, res) {

        categoriaRepo.findAndCount().then(function (categorias) {

            res.send(categorias);
        });
    });

    app.post('/api/categoria', function (req, res) {

        var categoria = req.body;
        if (!categoria) {
            res.sendStatus(500);
            return;
        }

        categoriaRepo.createOrUpdate(categoria).then(function (categoria) {
            res.send(categoria);
        });

    });

    app.delete('/api/categoria/:id', function (req, res) {

        var id = req.params.id;
        if (!id) {
            res.sendStatus(500);
            return;
        }

        categoriaRepo.delete(id).then(function (categoria) {

            res.send(categoria);
        });
    });
};