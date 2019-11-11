const express = require("express");
const router = express.Router();

router.get("/administrador/relatorios/listar", (req, res) => {
    res.render("administrador/relatorios/listar")
});

module.exports = router;