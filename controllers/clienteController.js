const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");

router.get("/cliente", (req, res) => {
    // BUSCANDO PERGUNTAS NO BANCO DE DADOS
    Cliente.findAll({ raw: true }).then( clientes => {
        res.render("cliente", {
            clientes: clientes
        });
    });
});

router.get("/cliente/cadastro", (req, res) => {
    res.render("cadastro");
});

module.exports = router;