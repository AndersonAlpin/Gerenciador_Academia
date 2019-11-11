const Sequelize = require("sequelize");
const connection = require("../database/database");

// Tabela Login
const Academia = connection.define('Academia', {
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