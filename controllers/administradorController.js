const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");

router.get("/administrador/", (req, res) => {
    var numClientes = 0;
    Cliente.findAll().then(clientes => {
        clientes.forEach(cliente => {
            numClientes++;
        });
        res.render("administrador/", {numClientes: numClientes});
    });
});

module.exports = router;