const express = require("express");
const router = express.Router();
const connection = require("../database/connection");
const Cliente = require("../models/Cliente");
const EnderecoCliente = require("../models/EnderecoCliente");
const Pacote = require("../models/Pacote");
const Sequelize = require("sequelize");
const adminAut = require("../middlewares/adminAut");

// LISTAR TODOS OS CLIENTES INCLUINDO O PACOTE E O ENDEREÇO
router.get("/administrador/clientes/listar", adminAut, (req, res) => {
    Cliente.findAll({
        order: [
            ['nome', 'ASC']
        ],
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

// LISTAR OS CLIENTES ATIVOS INCLUINDO O PACOTE E O ENDEREÇO
router.get("/administrador/clientes/ativos", adminAut, (req, res) => {
    Cliente.findAll({
        order: [
            ['nome', 'ASC']
        ],
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

// LISTAR OS CLIENTES INATIVOS INCLUINDO O PACOTE E O ENDEREÇO
router.get("/administrador/clientes/inativos", adminAut, (req, res) => {
    Cliente.findAll({
        order: [
            ['nome', 'ASC']
        ],
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

// FORMULÁRIO DE CADASTRO DO CLIENTE INCLUINDO O PACOTE
router.get("/administrador/clientes/cadastro", adminAut, (req, res) => {
    Pacote.findAll().then(pacote => {
        res.render("administrador/clientes/cadastro", { pacote: pacote });
    });
});

// SALVAR O CLIENTE APÓS PREENCHER O FORMULÁRIO
router.post("/clientes/salvar", adminAut,  (req, res) => {

    Cliente.create({
        nome: req.body.inputNome,
        sobrenome: req.body.inputSobrenome,
        dataNascimento: req.body.inputDate,
        cpf: req.body.inputCPF,
        telefone: req.body.inputTelefone,
        email: req.body.inputEmail,
        AcademiumId: '1',
        pacoteId: req.body.inputPacote
    }).then((cliente) => { //SE CADASTRAR O CLIENTE, CADASTRE O ENDEREÇO
        
        EnderecoCliente.create({
            logradouro: req.body.inputLogradouro,
            numero: req.body.inputNumero,
            cidade: req.body.inputCidade,
            bairro: req.body.inputBairro,
            cep: req.body.inputCEP,
            uf: req.body.inputUF,
            clienteId: cliente.id
        }).then(() => { //SE CADASTRAR REDIRECIONE PARA A LISTA
            connection.query('call primeiraMensalidade('+req.body.inputPacote+ ", '" + req.body.inputPagamento +"'" +')', {// CADASTRE A PRIMEIRA MENSALIDADE
                type: Sequelize.DataTypes.INSERT
            }).then(() => {
                res.redirect("/administrador/clientes/listar");
            }).catch((erro) => {
                res.redirect("/administrador/clientes/cadastro");
            });
        }).catch((erro) => {// SE NÃO CADASTRAR REDIRECIONE PARA O CADASTRO
            res.redirect("/administrador/clientes/cadastro");
        });
    }).catch((erro) => {// SE DER ERRO REDIRECION PARA O CADASTRO
        res.redirect("/administrador/clientes/cadastro");
    });
});

// DETALHAR O CLIENTE SELECIONADO NA TABELA
router.get("/administrador/clientes/detalhes/:id", adminAut, (req, res) => {
    var id = req.params.id;

    if (isNaN(id)) {
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
        if (cliente != undefined) {
            res.render("administrador/clientes/detalhes", { cliente: cliente });
        } else {
            res.redirect("/administrador/clientes/listar");
        }
    }).catch(erro => {
        res.redirect("/administrador/clientes/listar");
    });
});

// EDITAR UM CLIENTE SELECIONADO NA TABELA
router.get("/administrador/clientes/editar/:id", adminAut, (req, res) => {
    Pacote.findAll().then(pacote => {

        var id = req.params.id;

        if (isNaN(id)) {
            res.redirect("/administrador/clientes/editar");
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
            if (cliente != undefined) {
                res.render("administrador/clientes/editar", { cliente: cliente, pacote: pacote });
            } else {
                res.redirect("/administrador/clientes/listar");
            }
        }).catch(erro => {
            res.redirect("/administrador/clientes/listar");
        });
    });

});

module.exports = router;