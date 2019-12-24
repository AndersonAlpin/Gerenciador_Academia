const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const Administrador = require("../models/Administrador");
const EnderecoAdministrador = require("../models/EnderecoAdministrador");
const Login = require("../models/Login");
const adminAut = require("../middlewares/adminAut");

// HOME DO ADMINISTRADOR
router.get("/administrador/home", adminAut, (req, res) => {
    res.render("administrador/home");
});

// AUTENTICAÇÃO
router.post("/autenticacao", (req, res) => {
    let email = req.body.email;
    let senha = req.body.senha;

    let autenticarUsuario = async () => {

        let login = await Login.findOne({
            where: { email },
            include: [
                {
                    model: Administrador, require: true,
                    include: [{ model: EnderecoAdministrador }]
                }
            ]
        });

        try {
            if (login != undefined) {
                let correct = bcrypt.compareSync(senha, login.senha);

                if (correct) {
                    sessao(login);
                    res.redirect("/administrador/home");
                } else {
                    req.flash('senhaInvalida', 'Senha inválida');
                    req.flash('eValido', 'border: 1px solid green');
                    req.flash('sInvalida', 'border: 1px solid red');
                    res.redirect("/");
                }
            } else {
                req.flash('emailInvalido', 'Email inválido');
                req.flash('eInvalido', 'border: 1px solid red');
                res.redirect("/");
            }
        } catch (err) {
            console.log('Ocorreu um erro durante a validação: ' + err);
        }

    }

    let sessao = (login) => {
        req.session.login = {
            idLogin: login.id,
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
        global.admin = req.session.login;
    }

    autenticarUsuario();
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
    let senhaAtual = req.body.senhaAtual;
    let novaSenha = req.body.novaSenha;
    let confirmarNovaSenha = req.body.confirmarNovaSenha;

    let salt = bcrypt.genSaltSync(10);
    let hash = bcrypt.hashSync(novaSenha, salt);

    if (novaSenha != confirmarNovaSenha) {
        req.flash('error', 'As senhas não coincidem!');
        res.redirect("/administrador/editar/senha");
    }

    let atalizarSenha = async () => {

        let login = await Login.findOne({
            where: {
                id: admin.idLogin
            }
        });

        try {
            if (login != undefined) {

                let correct = bcrypt.compareSync(senhaAtual, login.senha);

                if (correct) {
                    Login.update({
                        senha: hash
                    }, {
                        where: {
                            id: admin.idLogin
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
        } catch (err) {
            console.log('Ocorreu um erro durante a alteração da senha' + err);
        }
    }

    atalizarSenha();
});

// SALVAR DADOS DA EDIÇÃO
router.post("/administrador/dados/update", adminAut, (req, res) => {
    let nome = req.body.inputNome;
    let sobrenome = req.body.inputSobrenome;
    let sexo = req.body.selectSexo;
    let dataNascimento = req.body.inputDate;
    let cpf = req.body.inputCPF;
    let telefone = req.body.inputTelefone;
    let email = req.body.inputEmail;
    let cep = req.body.inputCEP;
    let logradouro = req.body.inputLogradouro;
    let cidade = req.body.inputCidade;
    let bairro = req.body.inputBairro;
    let numero = req.body.inputNumero;
    let uf = req.body.selectUF;

    let atualizarDados = async () => {

        let administrador = Administrador.update({
            nome,
            sobrenome,
            sexo,
            dataNascimento,
            cpf,
            telefone,
            email
        }, {
            where: { id: admin.idAdmin }
        });

        let login = Login.update({
            email
        }, {
            where: { administradorId: admin.idAdmin }
        });

        let enderecoAdministrador = await EnderecoAdministrador.update({
            cep,
            logradouro,
            cidade,
            bairro,
            numero,
            uf
        }, {
            where: { administradorId: admin.idAdmin }
        });

        global.admin = {
            idLogin: admin.idLogin,
            idAdmin: admin.idAdmin,
            email,
            nome,
            sobrenome,
            sexo,
            dataNascimento,
            cpf,
            telefone,
            cep,
            logradouro,
            cidade,
            bairro,
            numero,
            uf
        }

        res.redirect("/administrador/perfil");
    }

    atualizarDados();
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
// let nome = 'Admin';
// let sobrenome = 'IronFit';
// let cpf = '045.123.451-15';
// let telefone = '(73)95543-1256';
// let AcademiumId = '1';
// let email = 'adminironfit@gmail.com';
// let senha = 'admin2001';

// let salt = bcrypt.genSaltSync(10);
// let hash = bcrypt.hashSync(senha, salt);

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