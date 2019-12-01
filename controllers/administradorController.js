const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");

router.get("/administrador/", (req, res) => {
    var numClientes = 0;
    var numAtraso = 0;
    var totalEntradas = 0;

    // MENSALIDADES ATRASADAS
    Mensalidade.findAll({
        where: {status: 'Em atraso'}
    }).then(mensalidades => {
        mensalidades.forEach(mensalidade => {
            numAtraso++;
        });
    });

    // TOTAL DE ENTRADAS
    Mensalidade.findAll({
        where: {status: 'Pago'}
    }).then(valores => {
        valores.forEach(valor => {
            totalEntradas += valor.valor
        });
    });


    // CLIENTES ATIVOS
    Cliente.findAll().then(clientes => {
        clientes.forEach(cliente => {
            numClientes++;
        });
        res.render("administrador/", {numClientes: numClientes, numAtraso: numAtraso, totalEntradas: totalEntradas});
    });
});


module.exports = router;