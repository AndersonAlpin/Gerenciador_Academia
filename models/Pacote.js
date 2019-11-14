const Sequelize = require("sequelize");
const connection = require("../database/connection");

// Tabela Pacote
const Pacote = connection.define('pacote', {
    id: {
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
        type: Sequelize.TEXT,
        allowNull: false
    },
    taxaDesconto: {
        type: Sequelize.DOUBLE,
        allowNull: false
    }
});

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
// Pacote.sync({force: true});

module.exports = Pacote;