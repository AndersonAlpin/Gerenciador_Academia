const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const Administrador = require("../models/Administrador");
const Pacote = require("../models/Pacote");
const EnderecoAdministrador = require("../models/EnderecoAdministrador");
const Login = require("../models/Login");
const adminAut = require("../middlewares/adminAut");
const enviarEmail = require('../email/send');

// HOME DO ADMINISTRADOR
router.get("/administrador/home", adminAut, (req, res) => {

    Pacote.findAll({
        where: { academiumId: admin.idAcademia }
    }).then(pacotes => {
        res.render("administrador/home", { pacotes });
    })

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

        if (login.administrador.ativo != 1) {
            req.flash('emailInativo', 'O usuário informado está inativo.');
            res.redirect("/");
        }

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
            idAcademia: login.administrador.academiumId,

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

// LISTAR TODOS OS ADMINISTRADORES INCLUINDO O ENDEREÇO
router.get("/administrador/admins/listar", adminAut, (req, res) => {

    let listarAdministradores = async () => {
        let administradores = await Administrador.findAll({
            where: { academiumId: admin.idAcademia, tipo: 'funcionario' },
            order: [['nome', 'ASC']],
            include: [
                {
                    model: EnderecoAdministrador
                }
            ]
        });

        res.render("administrador/admins/listar", { administradores });
    }

    listarAdministradores();

});

// DETALHAR O ADMINISTRADOR SELECIONADO NA TABELA
router.get("/administrador/admins/detalhes/:id", adminAut, (req, res) => {
    let id = req.params.id;

    if (isNaN(id)) {
        res.redirect("/administrador/admins/listar");
    }

    let detalharAdministrador = async () => {

        let administrador = await Administrador.findByPk(id, {
            include: [
                {
                    model: EnderecoAdministrador
                }
            ]
        }).catch(err => {
            res.redirect("/administrador/admins/listar");
            console.log('Não foi possível continuar com a busca do administrador: ' + err);
        });

        if (administrador != undefined) {
            res.render("administrador/admins/detalhes", { administrador });
        } else {
            res.redirect("/administrador/admins/listar");
        }

    }

    detalharAdministrador();
});

// FORMULÁRIO DE CADASTRO DO ADMINISTRADOR INCLUINDO
router.get("/administrador/admins/cadastro", adminAut, (req, res) => {
    res.render("administrador/admins/cadastro");
});

// SALVAR O ADMINISTRADOR APÓS PREENCHER O FORMULÁRIO
router.post("/administrador/salvar", adminAut, (req, res) => {

    let nome = req.body.inputNome
    let sobrenome = req.body.inputSobrenome;
    let sexo = req.body.selectSexo;
    let dataNascimento = req.body.inputDate;
    let cpf = req.body.inputCPF;
    let telefone = req.body.inputTelefone;
    let email = req.body.inputEmail;
    let senha = req.body.inputSenha;
    let logradouro = req.body.inputLogradouro;
    let numero = req.body.inputNumero;
    let cidade = req.body.inputCidade;
    let bairro = req.body.inputBairro;
    let cep = req.body.inputCEP;
    let uf = req.body.selectUF;

    let salt = bcrypt.genSaltSync(10);
    let hash = bcrypt.hashSync(senha, salt);

    let salvarAdministrador = async () => {

        let administrador = await Administrador.create({
            nome,
            sobrenome,
            sexo,
            dataNascimento,
            cpf,
            telefone,
            email,
            tipo: 'funcionario',
            academiumId: admin.idAcademia
        }).catch(err => {
            res.redirect("/administrador/admins/cadastro");
            console.log('Não foi possível cadastrar o administrador: ' + err);
        });

        await EnderecoAdministrador.create({
            logradouro,
            numero,
            cidade,
            bairro,
            cep,
            uf,
            administradorId: administrador.id
        }).catch(err => {
            res.redirect("/administrador/admins/cadastro");
            console.log('Não foi possível cadastrar o endereço: ' + erro);
        });

        await Login.create({
            administradorId: administrador.id,
            email: email,
            senha: hash
        })

        res.redirect("/administrador/admins/listar");
    }

    salvarAdministrador();
});

// PERFIL
router.get("/administrador/perfil", adminAut, (req, res) => {
    res.render("administrador/admins/perfil")
});

// EDITAR OS DADOS DO ADMINISTRADOR
router.get("/administrador/editar/dados", adminAut, (req, res) => {
    res.render("administrador/admins/editarDados");
});

// EDITAR SENHA DO ADMINISTRADOR
router.get("/administrador/editar/senha", adminAut, (req, res) => {
    res.render("administrador/admins/editarSenha");
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
            where: { id: admin.idLogin }
        });

        try {
            if (login != undefined) {

                let correct = bcrypt.compareSync(senhaAtual, login.senha);

                if (correct) {
                    Login.update({
                        senha: hash
                    }, {
                        where: { id: admin.idLogin }
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

// ATIVAR/INATIVAR ADMINISTRADOR
router.post("/administrador/admins/status/update", (req, res) => {
    let id = req.body.inputID;
    let status = req.body.inputStatus;
    let newStatus;

    if (status.toString() == 'false') {
        newStatus = true;
    } else {
        newStatus = false;
    }

    Administrador.update({
        ativo: newStatus
    }, {
        where: {
            id
        }
    }).then(() => {
        res.redirect("/administrador/admins/detalhes/" + id);
    });
});

// INFORMAR O EMAIL QUE FOI ESQUECIDO
router.get("/administrador/password/email", (req, res) => {
    res.render("administrador/password/email");
});

// ENVIAR LINK DE RECUPERAÇÃO
router.post("/send/link/reset", (req, res) => {
    let email = req.body.email;
    let codigo = Math.floor(Math.random() * 100000).toString();

    let salt = bcrypt.genSaltSync(10);
    let hash = bcrypt.hashSync(codigo, salt);

    Login.findOne({
        where: {
            email
        }
    }).then(login => {
        if (login != undefined) {

            req.session.hash = hash;
            req.session.email = email;

            enviarEmail.enviarLink(email);

            req.flash("ocultar", "display: none;");
            req.flash("color", "color: green;");
            req.flash("mensagemEmail", "Um link de recuperação foi enviado para o email informado.");
            res.redirect("/administrador/password/email");

        } else {
            req.flash("color", "color: red;");
            req.flash("mensagemEmail", "Email inválido.");
            res.redirect("/administrador/password/email");
        }
    })

});

// INFORMAR NOVA SENHA
router.get("/administrador/password/reset", (req, res) => {
    if (req.session.hash != undefined) {
        res.render("administrador/password/reset");
    } else {
        req.flash("ocultar", "display: none;")
        req.flash("color", "color: red;");
        req.flash("mensagemEmail", "O link de recuperação de senha expirou!");
        res.redirect("/administrador/password/email");
    }
});

// ALTERAR A SENHA
router.post("/salvar/nova-senha", (req, res) => {
    let novaSenha = req.body.novaSenha;
    let confirmarSenha = req.body.confirmarSenha;

    let salt = bcrypt.genSaltSync(10);
    let hash = bcrypt.hashSync(novaSenha, salt);

    if (novaSenha != confirmarSenha) {
        req.flash('senhaInvalida', 'As senhas não coincidem!');
        res.redirect("/administrador/password/reset");
    }

    if (req.session.hash != undefined) {

        Login.update({
            senha: hash
        }, {
            where: {
                email: req.session.email
            }
        }).then(() => {
            req.session.hash = null;
            req.session.email = null;
            res.redirect("/");
        })

    } else {
        req.flash("ocultar", "display: none;")
        req.flash("color", "color: red;");
        req.flash("mensagemEmail", "O link de recuperação de senha expirou!");
        res.redirect("/administrador/password/email");
    }

});

// DESLOGAR
router.get("/logout", (req, res) => {
    req.session.login = undefined;
    res.redirect("/");
});

module.exports = router;