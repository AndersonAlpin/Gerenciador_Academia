const Sequelize = require("sequelize");
const connection = require("../database/connection");
const Academia = require("../models/Academia"); // Importando Academia para gerar chave estrangeira

// Tabela Administrador
const Administrador = connection.define('administrador', {
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
    sobrenome: {
        type: Sequelize.STRING,
        allowNull: false
    },
    cpf: {
        type: Sequelize.STRING,
        allowNull: true
    },
    telefone: {
        type: Sequelize.STRING,
        allowNull: true
    },
    telefone: {
        type: Sequelize.STRING,
        allowNull: true
    }
});

// Gerando chave estrangeira de Academia na tabela Administrador
Academia.hasMany(Administrador);
Administrador.belongsTo(Academia);

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
// Administrador.sync({force: false}); 

module.exports = Administrador;