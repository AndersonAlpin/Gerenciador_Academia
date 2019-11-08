const Sequelize = require("sequelize");
const connection = require("../database/database");
const Cliente = require("../models/Cliente"); // Importando Cliente para gerar chave estrangeira

// Tabela Mensalidade
const Mensalidade = connection.define('mensalidade', {
    mensalidadeID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    valor: {
        type: Sequelize.DOUBLE,
        allowNull: false
    },
    dataEmissao: {
        type: Sequelize.DATE,
        allowNull: false
    },
    dataVencimento: {
        type: Sequelize.DATE,
        allowNull: false
    },
    dataPagamento: {
        type: Sequelize.DATE,
        allowNull: true
    },
    status: {
        type: Sequelize.STRING,
        allowNull: false,
        defaultValue: 'Em aberto'
    }
});

// Gerando chave estrangeira de Cliente na tabela Mensalidade
Mensalidade.belongsTo(Cliente, {foreignKey: 'clienteID', constraints: false, as: 'Cliente'});

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
Mensalidade.sync({force: true}); 

module.exports = Mensalidade;