const Sequelize = require("sequelize");

const connection = new Sequelize('academiaironfit', 'academiaironfit', 'admin2001', {
    // host: 'localhost',
    // dialect: 'mysql',
    // timezone: "-03:00"
    
    host: 'mysql669.umbler.com',
    dialect: 'mysql',
    timezone: "-03:00",
    port: 41890
});

module.exports = connection;
