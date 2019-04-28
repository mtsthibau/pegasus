module.exports = function (app) {

    var bannerRepo = require('./bannerRepo')(app);

    app.get('/api/banner', function (req, res) {

        bannerRepo.findAndCount().then(function (banners) {

            res.send(banners);
        });
    });

    app.post('/api/banner', function (req, res) {

        var banner = req.body;
        if (!banner) {
            res.sendStatus(500);
            return;
        }

        bannerRepo.createOrUpdate(banner).then(function (banner) {
            res.send(banner);
        });

    });

    app.delete('/api/banner/:id', function (req, res) {

        var id = req.params.id;
        if (!id) {
            res.sendStatus(500);
            return;
        }

        bannerRepo.delete(id).then(function (banner) {

            res.send(banner);
        });
    });
};

