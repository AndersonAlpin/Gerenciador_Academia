const Sequelize = require("sequelize");

const connection = new Sequelize('gerenacademia', 'gerenacademia', 'academia', {
    host: 'mysql669.umbler.com',
    dialect: 'mysql',
    timezone: "-03:00"
});

module.exports = connection;