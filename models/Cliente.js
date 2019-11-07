const Sequelize = require("sequelize");
const connection = require("../database/database");

const Cliente = connection.define('cliente', {
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    sobrenome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    cpf: {
        type: Sequelize.STRING,
        allowNull: true
    },
    telefone: {
        type: Sequelize.INT,
        allowNull: true
    },
    email: {
        type: Sequelize.STRING,
        allowNull: true
    },
    
});

module.exports = Cliente;