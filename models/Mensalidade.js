const Sequelize = require("sequelize");
const connection = require("../database/database");

const Mensalidade = connection.define('mensalidade', {
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

module.exports = Mensalidade;