/**
 * Created by matheus on 29/03/2016.
 */
module.exports = function (app) {

    var postagemRepo = require('./postagemRepo')(app);

    app.get('/api/postagem', function (req, res) {

        postagemRepo.findAndCount().then(function (postagems) {

            res.send(postagems);
        });
    });

    app.post('/api/postagem', function (req, res) {

        var postagem = req.body;
        if (!postagem) {
            res.sendStatus(500);
            return;
        }

        postagemRepo.createOrUpdate(postagem).then(function (postagem) {
            res.send(postagem);
        });

    });

    app.delete('/api/postagem/:id', function (req, res) {

        var id = req.params.id;
        if (!id) {
            res.sendStatus(500);
            return;
        }

        postagemRepo.delete(id).then(function (postagem) {

            res.send(postagem);
        });
    });
};

