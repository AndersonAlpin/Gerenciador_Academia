const Sequelize = require("sequelize");


const connection = new Sequelize('academia', 'root', '', {
    host: 'localhost',
    dialect: 'mysql'
});

module.exports = connection;