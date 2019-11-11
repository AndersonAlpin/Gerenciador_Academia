const express = require("express");
const router = express.Router();
const Pacote = require("../models/Pacote")

router.get("/administrador/pacotes/listar", (req, res) => {
    Pacote.findAll({force: true}).then(pacotes => {
        res.render("administrador/pacotes/listar", {pacotes: pacotes});
    });
});

router.get("/administrador/pacotes/cadastro", (req, res) => {
    res.render("administrador/pacotes/cadastro")
});

router.post("/pacotes/salvar", (req, res) => {
    
});

module.exports = router;