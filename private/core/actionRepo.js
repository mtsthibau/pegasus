module.exports = function (app) {

    var docRepo = require(app.rootPath + '/db/docRepo')(app);
    var prefix = "act.";

    return {
        findAndCount: function (docType) {
            return docRepo.findAndCount(prefix + docType);
        },

        createOrUpdate: function (docType, inst) {

            if (!inst.data) {
                inst.data = {};
            }

            return docRepo.createOrUpdate(prefix + docType, inst);
        },

        get: function (id) {
            return docRepo.get(id);
        },

        delete: function (id) {
            return docRepo.delete(id);
        },

        dummy: 0
    };
};