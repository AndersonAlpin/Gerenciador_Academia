const express = require("express");
const router = express.Router();
const connection = require("../database/connection");
const mysql = require("mysql2/promise");
const Cliente = require("../models/Cliente");
const EnderecoCliente = require("../models/EnderecoCliente");
const Pacote = require("../models/Pacote");

router.get("/administrador/clientes/listar", (req, res) => {
    Cliente.findAll({
        raw: true,
        include: [{model: Pacote}]
    }).then(clientes => {
        console.log(clientes)
        res.render("administrador/clientes/listar", {clientes: clientes});
    });
});

router.get("/administrador/clientes/cadastro", (req, res) => {
    res.render("administrador/clientes/cadastro");
});

router.post("/clientes/salvar", (req, res) => {
    
});

// var idPacote = 'indefinido no momento';

// mysql.createConnection({
//     user: 'root',
//     password: ''
// }).then(() => {
//     connection.query('call gerarMensalidades('+idPacote+')');
// });

module.exports = router;