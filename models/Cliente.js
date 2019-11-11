const Sequelize = require("sequelize");
const connection = require("../database/database");
const Pacote = require("../models/Pacote"); // Importando Pacote para gerar chave estrangeira
const Academia = require("../models/Academia"); // Importando Pacote para gerar chave estrangeira

// Tabela Cliente
const Cliente = connection.define('cliente', {
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
    email: {
        type: Sequelize.STRING,
        allowNull: true
    },
    ativo: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: true
    }
});

// Gerando chave estrangeira de Academia na tabela Cliente
Academia.hasMany(Cliente);
Cliente.belongsTo(Academia);
Pacote.hasMany(Cliente);
Cliente.belongsTo(Pacote);

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
Cliente.sync({force: false}); 

module.exports = Cliente;