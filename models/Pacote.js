const Sequelize = require("sequelize");
const connection = require("../database/database");

// Tabela Pacote
const Pacote = connection.define('pacote', {
    pacoteID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    descricao: {
        type: Sequelize.STRING,
        allowNull: false
    },
    taxaDesconto: {
        type: Sequelize.DOUBLE,
        allowNull: true
    }
});

Pacote.sync({force: true}); // Necessário para criar a base de dados. Comentar este trecho após executar o servidor

module.exports = Pacote;