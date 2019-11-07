const Sequelize = require("sequelize");
const connection = require("../database/database");

const Pacote = connection.define('pacote', {
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    descricao: {
        type: Sequelize.STRING,
        allowNull: false
    },
    taxadesconto: {
        type: Sequelize.DOUBLE,
        allowNull: true
    }
});

module.exports = Pacote;