const Sequelize = require("sequelize");
const connection = require("../database/connection");

// Tabela Login
const Academia = connection.define('academia', {
    id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
// Academia.sync({force: false}); 

module.exports = Academia;