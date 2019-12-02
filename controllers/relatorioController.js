const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");

router.get("/administrador/relatorios/listar", adminAut, (req, res) => {
    res.render("administrador/relatorios/listar")
});

module.exports = router;