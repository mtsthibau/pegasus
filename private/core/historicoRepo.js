/**
 * Created by matheus on 30/03/2016.
 */
module.exports = function (app) {

    var docRepo = require(app.rootPath + '/db/docRepo')(app);
    var docType = "historico";

    return {
        findAndCount: function () {
            return docRepo.findAndCount(docType);
        },

        createOrUpdate: function (inst) {

            if (!inst.data) {
                inst.data = {};
            }

            return docRepo.createOrUpdate(docType, inst);
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


