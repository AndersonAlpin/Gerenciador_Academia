const Sequelize = require("sequelize");
const connection = require("../database/database");

const Login = connection.define('login', {
    email: {
        type: Sequelize.STRING,
        allowNull: false
    },
    senha: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

module.exports = Login;