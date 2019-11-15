const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");

router.get("/administrador/", (req, res) => {
    var numClientes = 0;
    var numAtraso = 0;

    Mensalidade.findAll({
        where: {status: 'Em atraso'}
    }).then(mensalidades => {
        mensalidades.forEach(mensalidade => {
            numAtraso++;
        });
    });

    Cliente.findAll().then(clientes => {
        clientes.forEach(cliente => {
            numClientes++;
        });
        res.render("administrador/", {numClientes: numClientes, numAtraso: numAtraso});
    });
});

module.exports = router;