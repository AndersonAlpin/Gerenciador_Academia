const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const Administrador = require("../models/Administrador");
const EnderecoAdministrador = require("../models/EnderecoAdministrador");
const Login = require("../models/Login");
const adminAut = require("../middlewares/adminAut");
const enviarEmail = require("../email/send");

// HOME DO ADMINISTRADOR
router.get("/administrador/home", adminAut, (req, res) => {
    res.render("administrador/home");
});

// AUTENTICAÇÃO
router.post("/autenticacao", (req, res) => {
    var email = req.body.email;
    var senha = req.body.senha;

    Login.findOne({
        where: { email: email },
        include: [
            {
                model: Administrador, required: true,
                include: [
                    {
                        model: EnderecoAdministrador
                    }
                ]
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
                    idEndereco: login.administrador.enderecoadministrador.id,
                    idAcademia: login.administrador.AcademiumId,

                    nome: login.administrador.nome,
                    sobrenome: login.administrador.sobrenome,
                    sexo: login.administrador.sexo,
                    dataNascimento: login.administrador.dataNascimento,
                    cpf: login.administrador.cpf,
                    telefone: login.administrador.telefone,
                    email: login.administrador.email,
                    tipo: login.administrador.tipo,
                    ativo: login.administrador.ativo,

                    logradouro: login.administrador.enderecoadministrador.logradouro,
                    numero: login.administrador.enderecoadministrador.numero,
                    cidade: login.administrador.enderecoadministrador.cidade,
                    bairro: login.administrador.enderecoadministrador.bairro,
                    cep: login.administrador.enderecoadministrador.cep,
                    uf: login.administrador.enderecoadministrador.uf
                }
                res.redirect("/administrador/home");
                global.admin = req.session.login;
            } else {
                req.flash('error', 'Senha incorreta!');
                res.redirect("/");
            }
        } else {
            req.flash('error', 'Este email não existe!');
            res.redirect("/");
        }
    });
});

// PERFIL
router.get("/administrador/perfil", adminAut, (req, res) => {
    res.render("administrador/perfil")
});

// EDITAR OS DADOS DO ADMINISTRADOR
router.get("/administrador/editar/dados", adminAut, (req, res) => {
    res.render("administrador/editarDados");
});

// EDITAR SENHA DO ADMINISTRADOR
router.get("/administrador/editar/senha", adminAut, (req, res) => {
    res.render("administrador/editarSenha");
});

// SALVAR NOVA SENHA
router.post("/administrador/senha/update", adminAut, (req, res) => {
    console.log("certo")

    var senhaAtual = req.body.senhaAtual;
    var novaSenha = req.body.novaSenha;
    var confirmarNovaSenha = req.body.confirmarNovaSenha;

    var salt = bcrypt.genSaltSync(10);
    var hash = bcrypt.hashSync(novaSenha, salt);

    if (novaSenha != confirmarNovaSenha) {
        req.flash('error', 'As senhas não coincidem!');
        res.redirect("/administrador/editar/senha");
    }

    Login.findOne({
        where: {
            id: admin.id
        }
    }).then(login => {
        if (login != undefined) {

            var correct = bcrypt.compareSync(senhaAtual, login.senha);

            if (correct) {
                Login.update({
                    senha: hash
                }, {
                    where: {
                        id: admin.id
                    }
                }).then(() => {
                    res.redirect("/administrador/perfil")
                });
            } else {
                req.flash('error', 'Senha inválida!');
                res.redirect("/administrador/editar/senha");
            }

        } else {
            res.redirect("/administrador/editar/senha");
        }
    });

});

// SALVAR DADOS DA EDIÇÃO
router.post("/administrador/dados/update", adminAut, (req, res) => {
    var nome = req.body.inputNome;
    var sobrenome = req.body.inputSobrenome;
    var dataNascimento = req.body.inputDate;
    var cpf = req.body.inputCPF;
    var telefone = req.body.inputTelefone;
    var email = req.body.inputEmail;
    var cep = req.body.inputCEP;
    var logradouro = req.body.inputLogradouro;
    var cidade = req.body.inputCidade;
    var bairro = req.body.inputBairro;
    var numero = req.body.inputNumero;
    var uf = req.body.inputUF;

    Administrador.update({
        nome: nome,
        sobrenome: sobrenome,
        dataNascimento: dataNascimento,
        cpf: cpf,
        telefone: telefone,
        email: email
    }, {
        where: {
            id: admin.idAdmin
        }
    }).then(() => {

        Login.update({
            email: email
        }, {
            where: {
                administradorId: admin.idAdmin
            }
        }).then(() => {

            EnderecoAdministrador.update({
                cep: cep,
                logradouro: logradouro,
                cidade: cidade,
                bairro: bairro,
                numero: numero,
                uf: uf
            },{
                where: {
                    administradorId: admin.idAdmin
                }
            }).then((endereco) => {

                global.admin = {
                    id: admin.id,
                    idAdmin: admin.idAdmin,
                    email: email,
                    nome: nome,
                    sobrenome: sobrenome,
                    dataNascimento: dataNascimento,
                    cpf: cpf,
                    telefone: telefone,
                    cep: cep,
                    logradouro: logradouro,
                    cidade: cidade,
                    bairro: bairro,
                    numero: numero,
                    uf: uf
                }
                res.redirect("/administrador/perfil");

            });

        });

    });

});

// ENVIAR CÓDIGO DE RECUPERAÇÃO PARA O EMAIL
router.get("/administrador/resetPassword/code", (req, res) => {
    res.render("administrador/resetPassword/code");
});

// ALTERAR A SENHA
router.get("/administrador/resetPassword/alterPassword", (req, res) => {
    res.render("administrador/resetPassword/alterPassword");
});

// DESLOGAR
router.get("/logout", (req, res) => {
    req.session.login = undefined;
    res.redirect("/");
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