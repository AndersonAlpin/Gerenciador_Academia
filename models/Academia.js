const Sequelize = require("sequelize");
const connection = require("../database/database");

const Academia = connection.define('academia', {
    nome: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

module.exports = Academia;