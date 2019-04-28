var Q = require('q');

module.exports = function (app) {

    return {

        findAndCount: function (type) {
            var options = {order: [['updatedAt', 'DESC']]};
            if (type) {
                options.where = {type: {$like: type}};
            }
            return app.db.document.findAndCount(options);
        },

        createOrUpdate: function (type, inst) {

            var deferred = Q.defer();

            if (!inst.id) {

                app.db.document.create({type: type, data: inst.data}).then(function (newInst) {
                    deferred.resolve(newInst);
                });
            }
            else {

                this.get(inst.id).then(function (newInst) {

                    // todo - optmistic locking
                    //if (newInst.updatedAt != inst.updatedAt)
                    //    throw 'ERRO!';

                    newInst.data = inst.data;
                    newInst.save().then(function (newInst) {
                        deferred.resolve(newInst);
                    });
                });
            }

            return deferred.promise;
        },

        get: function (id) {
            return app.db.document.findByPrimary(id);
        },

        findOne: function (options) {
            return app.db.document.findOne(options);
        },

        delete: function (id) {
            var deferred = Q.defer();
            this.get(id).then(function (inst) {

                inst.destroy().then(function (inst) {
                    deferred.resolve(inst);
                });
            });

            return deferred.promise;
        },

        dummy: 0
    };
};