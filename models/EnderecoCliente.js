const Sequelize = require("sequelize");
const connection = require("../database/database");
const Cliente = require("../models/Cliente"); // Importando Cliente para gerar chave estrangeira

// Tabela EnderecoCliente
const EnderecoCliente = connection.define('enderecocliente', {
    enderecoClienteID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    logradouro: {
        type: Sequelize.STRING,
        allowNull: false
    },
    numero: {
        type: Sequelize.STRING,
        allowNull: false
    },
    cidade: {
        type: Sequelize.STRING,
        allowNull: false
    },
    bairro: {
        type: Sequelize.STRING,
        allowNull: false
    },
    cep: {
        type: Sequelize.STRING,
        allowNull: false
    },
    uf: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

// Gerando chave estrangeira de Cliente na tabela EnderecoCliente
EnderecoCliente.belongsTo(Cliente, {foreignKey: 'clienteID', constraints: false, as: 'Cliente'}); 

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
EnderecoCliente.sync({force: true}); 

module.exports = EnderecoCliente;