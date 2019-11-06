const express = require("express");
const router = express.Router();

router.get("/cliente", (req, res) => {
    res.render("cliente");
});

router.get("/cliente/cadastro-cliente", (req, res) => {
    res.render("cadastro-cliente");
});

module.exports = router;