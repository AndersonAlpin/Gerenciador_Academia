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
        where: {
            AcademiumId: admin.idAcademia
        },
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
        where: {
            AcademiumId: admin.idAcademia
        },
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
        where: {
            AcademiumId: admin.idAcademia
        },
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
    Pacote.findAll({
        where: {
            AcademiumId: admin.idAcademia
        }
    }).then(pacote => {
        res.render("administrador/clientes/cadastro", { pacote: pacote });
    });
});

// SALVAR O CLIENTE APÓS PREENCHER O FORMULÁRIO
router.post("/clientes/salvar", adminAut, (req, res) => {
    
    var nome = req.body.inputNome
    var sobrenome = req.body.inputSobrenome;
    var sexo = req.body.selectSexo;
    var dataNascimento = req.body.inputDate;
    var cpf = req.body.inputCPF;
    var telefone = req.body.inputTelefone;
    var email = req.body.inputEmail;
    var pacoteId = req.body.selectPacote;
    var formaPagamento = req.body.selectPagamento;
    var logradouro = req.body.inputLogradouro;
    var numero = req.body.inputNumero;
    var cidade = req.body.inputCidade;
    var bairro = req.body.inputBairro;
    var cep = req.body.inputCEP;
    var uf = req.body.selectUF;

    Cliente.create({
        nome: nome,
        sobrenome: sobrenome,
        sexo: sexo,
        dataNascimento: dataNascimento,
        cpf: cpf,
        telefone: telefone,
        email: email,
        AcademiumId: admin.idAcademia,
        pacoteId: pacoteId
    }).then((cliente) => { //SE CADASTRAR O CLIENTE, CADASTRE O ENDEREÇO
        
        EnderecoCliente.create({
            logradouro: logradouro,
            numero: numero,
            cidade: cidade,
            bairro: bairro,
            cep: cep,
            uf: uf,
            clienteId: cliente.id
        }).then(() => { //SE CADASTRAR REDIRECIONE PARA A LISTA
            connection.query(`call primeiraMensalidadePaga('${pacoteId}', '${formaPagamento}')`, {
                type: Sequelize.DataTypes.INSERT
            }).then(() => {
                connection.query('call primeiraMensalidadeAberta()', {
                    type: Sequelize.DataTypes.INSERT
                }).then(() => {
                    res.redirect("/administrador/clientes/listar");
                });
            }).catch((erro) => {
                res.redirect("/administrador/clientes/cadastro");
                console.log('Não foi possível gerar mensalidade: ' + erro);
            });
        }).catch((erro) => {// SE NÃO CADASTRAR REDIRECIONE PARA O CADASTRO
            res.redirect("/administrador/clientes/cadastro");
            console.log('Não foi possível cadastrar o endereço: ' + erro);
        });
    }).catch((erro) => {// SE DER ERRO REDIRECION PARA O CADASTRO
        res.redirect("/administrador/clientes/cadastro");
        console.log('Não foi possível cadastrar o cliente: ' + erro);
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
    Pacote.findAll({
        where: {
            AcademiumId: admin.idAcademia
        }
    }).then(pacote => {

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

// SALVAR DADOS DA EDIÇÃO
router.post("/administrador/clientes/update", adminAut, (req, res) => {
    var id = req.body.inputID;
    var nome = req.body.inputNome
    var sobrenome = req.body.inputSobrenome;
    var sexo = req.body.selectSexo;
    var dataNascimento = req.body.inputDate;
    var cpf = req.body.inputCPF;
    var telefone = req.body.inputTelefone;
    var email = req.body.inputEmail;
    var pacoteId = req.body.selectPacote;
    var logradouro = req.body.inputLogradouro;
    var numero = req.body.inputNumero;
    var cidade = req.body.inputCidade;
    var bairro = req.body.inputBairro;
    var cep = req.body.inputCEP;
    var uf = req.body.selectUF;

    Cliente.update({
        nome: nome,
        sobrenome: sobrenome,
        sexo: sexo,
        dataNascimento: dataNascimento,
        cpf: cpf,
        telefone: telefone,
        email: email,
        pacoteId: pacoteId
    }, {
        where: {
            id: id
        }
    }).then(() => {

        EnderecoCliente.update({
            logradouro: logradouro,
            numero: numero,
            cidade: cidade,
            bairro: bairro,
            cep: cep,
            uf: uf
        }, {
            where: {
                clienteId: id
            }
        }).then(() => {
            res.redirect("/administrador/clientes/detalhes/" + id)
        });

    });

});

// ATIVAR/INATIVAR CLIENTE
router.post("/administrador/clientes/status/update", (req, res) => {
    var id = req.body.inputID;
    var status = req.body.inputStatus;
    var newStatus;

    if(status.toString() == 'false'){
        newStatus = true;
    }else {
        newStatus = false;
    }
    
    Cliente.update({
        ativo: newStatus
    }, {
        where: {
            id: id
        }
    }).then(() => {
        res.redirect("/administrador/clientes/detalhes/" + id);
    });
});

module.exports = router;