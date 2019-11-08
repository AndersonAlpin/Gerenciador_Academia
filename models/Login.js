const Sequelize = require("sequelize");
const connection = require("../database/database");
const Administrador = require("../models/Administrador"); // Importando Administrador para gerar chave estrangeira

// Tabela Login
const Login = connection.define('login', {
    loginID: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    email: {
        type: Sequelize.STRING,
        allowNull: false
    },
    senha: {
        type: Sequelize.STRING,
        allowNull: false
    }
});

// Gerando chave estrangeira de Administrador na tabela Login
Login.belongsTo(Administrador, {foreignKey: 'administradorID', constraints: false, as: 'Administrador'});

// Necessário para criar a base de dados. Comentar este trecho após executar o servidor
// Login.sync({force: true}); 

module.exports = Login;