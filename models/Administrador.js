const Sequelize = require("sequelize");
const connection = require("../database/database");
const Academia = require("../models/Academia"); // Importando Academia para gerar chave estrangeira

// Tabela Administrador
const Administrador = connection.define('administrador', {
    administradorID: {
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
        allowNull: false
    },
    telefone: {
        type: Sequelize.STRING,
        allowNull: false
    },
    telefone: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

// Gerando chave estrangeira de Academia na tabela Administrador
Administrador.belongsTo(Academia, {foreignKey: 'academiaID', constraints: false, as: 'Academia'});

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
Administrador.sync({force: true}); 

module.exports = Administrador;