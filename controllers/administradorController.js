const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");
const Administrador = require("../models/Administrador");
const Login = require("../models/Login");
const adminAut = require("../middlewares/adminAut");

// HOME DO ADMINISTRADOR
router.get("/administrador/home", adminAut, (req, res) => {
    var numClientes = 0;
    var numAtraso = 0;
    var totalEntradas = 0;

    // MENSALIDADES ATRASADAS
    Mensalidade.findAll({
        where: { status: 'Em atraso' }
    }).then(mensalidades => {
        mensalidades.forEach(mensalidade => {
            numAtraso++;
        });
    });

    // TOTAL DE ENTRADAS
    Mensalidade.findAll({
        where: { status: 'Pago' }
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
        res.render("administrador/home", { numClientes: numClientes, numAtraso: numAtraso, totalEntradas: totalEntradas });
    });
});

// AUTENTICAÇÃO
router.post("/autenticacao", (req, res) => {
    var email = req.body.email;
    var senha = req.body.senha;

    Login.findOne({
        where: { email: email },
        include: [
            {
                model: Administrador
            }
        ]
    }).then(login => {
        if (login != undefined) { // SE O EMAIL EXISTIR
            // VALIDAR SENHA
            var correct = bcrypt.compareSync(senha, login.senha);

            if (correct) {
                req.session.login = {
                    id: login.id,
                    idAdmin: login.administrador.id,
                    email: login.email,
                    nome: login.administrador.nome,
                    sobrenome: login.administrador.sobrenome,
                    cpf: login.administrador.cpf,
                    telefone: login.administrador.telefone,
                }
                res.redirect("/administrador/home");
                global.admin = req.session.login;
                // var milisegundos = req.session.cookie.maxAge;
                // var minuto = (milisegundos / 60000) % 60;
                // global.sessao = minuto.toFixed(0);
            } else {
                req.flash('error', 'Senha incorreta!');
                res.redirect("/login");
            }
        } else {
            req.flash('error', 'Este email não existe!');
            res.redirect("/login");
        }
    });
});

// DESLOGAR
router.get("/logout", (req, res) => {
    req.session.login = undefined;
    res.redirect("/login");
});

// GERAR UM ADMINISTRADOR
// var nome = 'Admin';
// var sobrenome = 'IronFit';
// var cpf = '045.123.451-15';
// var telefone = '(73)95543-1256';
// var AcademiumId = '1';
// var email = 'adminironfit@gmail.com';
// var senha = 'admin2001';

// var salt = bcrypt.genSaltSync(10);
// var hash = bcrypt.hashSync(senha, salt);

// Administrador.create({
//     nome: nome,
//     sobrenome: sobrenome,
//     cpf: cpf,
//     telefone: telefone
// }).then((administrador) => {

//     Login.create({
//         administradorId: administrador.id,
//         email: email,
//         senha: hash
//     })

// });


module.exports = router;