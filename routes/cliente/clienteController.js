const express = require("express");
const router = express.Router();

router.get("/cliente", (req, res) => {
    res.render("cliente");
});

router.get("/cliente/cadastro", (req, res) => {
    res.render("cadastro");
});

module.exports = router;