const express = require("express");
const router = express.Router();
const connection = require("../database/connection");
const mysql = require("mysql2/promise");
const Cliente = require("../models/Cliente");
const EnderecoCliente = require("../models/EnderecoCliente");
const Pacote = require("../models/Pacote");

router.get("/administrador/clientes/listar", (req, res) => {
    Cliente.findAll({
        include: [
            {
                model: EnderecoCliente
            },
            {
                model: Pacote
            }
        ]
    }).then(clientes => {
        res.render("administrador/clientes/listar", { clientes: clientes });
    });
});


router.get("/administrador/clientes/ativos", (req, res) => {
    Cliente.findAll({
        include: [
            {
                model: EnderecoCliente
            },
            {
                model: Pacote
            }
        ]
    }).then(clientes => {
        res.render("administrador/clientes/ativos", { clientes: clientes });
    });
});

router.get("/administrador/clientes/inativos", (req, res) => {
    Cliente.findAll({
        include: [
            {
                model: EnderecoCliente
            },
            {
                model: Pacote
            }
        ]
    }).then(clientes => {
        res.render("administrador/clientes/inativos", { clientes: clientes });
    });
});

router.get("/administrador/clientes/cadastro", (req, res) => {
    Pacote.findAll().then(pacote => {
        res.render("administrador/clientes/cadastro", {pacote: pacote});
    });
});

router.post("/clientes/salvar", (req, res) => {

});

router.get("/administrador/clientes/detalhes/:id", (req, res) => {
    var id = req.params.id;
    
    if(isNaN(id)){
        res.redirect("/administrador/clientes/listar");
    }
    
    Cliente.findByPk(id, {
        include: [
            {
                model: Pacote
            },
            {
                model: EnderecoCliente
            }
        ]
    }).then(cliente => {
        if(cliente != undefined){
            res.render("administrador/clientes/detalhes", {cliente: cliente});
        }else{
            res.redirect("/administrador/clientes/listar");
        }
    }).catch(erro => {
        res.redirect("/administrador/clientes/listar");
    });
});

// var idPacote = 'indefinido no momento';

// mysql.createConnection({
//     user: 'root',
//     password: ''
// }).then(() => {
//     connection.query('call primeiraMensalidade('+idPacote+')');
// });

module.exports = router;