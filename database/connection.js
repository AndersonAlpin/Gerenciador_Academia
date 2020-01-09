const Sequelize = require("sequelize");

// const connection = new Sequelize('sublimeteste', 'root', '', {
//     // host: 'localhost',
//     // dialect: 'mysql',
//     // timezone: "-03:00"
// });

const connection = new Sequelize('sublimeteste', 'sublimeteste', '542xB7aF', {
    host: 'mysql669.umbler.com',
    dialect: 'mysql',
    timezone: "-03:00",
    port: 41890
});

// const connection = new Sequelize('sublimemanager', 'innovation', '74abN1729.X#', {
//     host: 'mysql669.umbler.com',
//     dialect: 'mysql',
//     timezone: "-03:00",
//     port: 41890
// });

module.exports = connection;
