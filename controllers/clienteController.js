const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");

router.get("/administrador/clientes/listar", (req, res) => {
    Cliente.findAll({raw: true}).then(clientes => {
        res.render("administrador/clientes/listar", {clientes: clientes});
    });
});

router.get("/administrador/clientes/cadastro", (req, res) => {
    res.render("administrador/clientes/cadastro");
});

router.post("/clientes/salvar", (req, res) => {
    
});

module.exports = router;