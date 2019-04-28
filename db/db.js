var Q = require('q');
var DataTypes = require('sequelize');
var config = require('./config.js');
var sequelize = new DataTypes(config.url);

// Definição da estrutura da tabela e suas colunas NOSQL
var document = sequelize.define("document", {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true
    },
    type: DataTypes.STRING,
    data: DataTypes.JSONB
}, {
    tableName: 'document',
    paranoid: true
});

//verifica se os registros existem se não insere
document.sync().then(function () {

    document.findAndCount().then(function (res) {
        if (res.count != 0)
            return;
        var docs = require('./load.json');
        for (var i = 0; i < docs.length; i++) {
            if (docs[i] != null)
            //todos os registros são listados a seguir
                document.create({type: docs[i].type, data: docs[i].data});
        }
    });
});

var version = sequelize.define("version", {
    id: {type: DataTypes.BIGINT, primaryKey: true, autoIncrement: true},
    docId: DataTypes.BIGINT,
    data: DataTypes.JSONB
}, {
    tableName: 'version',
    paranoid: true
});

version.sync();

module.exports = {

    // NO-SQL
    document: document,
    version: version,

    // RAW - executa a QUERY - Impressão de que é uma verificação da tabala apos as alterações
    query: function (sql, limit, offset) {
        var deferred = Q.defer();
        var rows = null;
        var options = {type: sequelize.QueryTypes.SELECT};
        var mainSql = sql;

        if (limit)
            mainSql += ' limit ' + limit;

        if (offset)
            mainSql += ' offset ' + offset;

        sequelize.query(mainSql, options).then(function (data) {

            rows = data;
            return sequelize.query("select count(*) as value from (" + sql + ")x", options);

        }).then(function (count) {

            deferred.resolve({count: count[0].value, rows: rows});
        });

        return deferred.promise;
    }
};