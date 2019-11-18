const Sequelize = require("sequelize");
const connection = require("../database/connection");

// Tabela Pacote
const Pacote = connection.define('pacote', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: true,
        autoIncrement: true,
        primaryKey: true
    },
    nome: {
        type: Sequelize.STRING,
        allowNull: true
    },
    descricao: {
        type: Sequelize.TEXT,
        allowNull: true
    },
    taxaDesconto: {
        type: Sequelize.DOUBLE,
        allowNull: true
    }
});

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
// Pacote.sync({force: true});

module.exports = Pacote;