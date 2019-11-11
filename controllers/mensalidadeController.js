const express = require("express");
const router = express.Router();

router.get("/administrador/mensalidades/listar", (req, res) => {
    res.render("administrador/mensalidades/listar")
});

router.get("/administrador/mensalidades/alterar", (req, res) => {
    res.render("administrador/mensalidades/alterar")
});

router.post("/mensalidades/validar", (req, res) => {
    
});

module.exports = router;