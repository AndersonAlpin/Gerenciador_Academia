const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");
const Pacote = require("../models/Pacote");
const adminAut = require("../middlewares/adminAut");
const connection = require("../database/connection");
const Sequelize = require("sequelize");

// MENSALIDADES EM ABERTO
router.get("/administrador/mensalidades/aberto", adminAut, (req, res) => {
    Mensalidade.findAll({
        order: [
            ['dataVencimento', 'ASC']
        ],
        include: [
            {
                model: Cliente, required: true,
                where: { academiumId: admin.idAcademia }
            }
        ]
    }).then(mensalidades => {
        res.render("administrador/mensalidades/aberto", { mensalidades })
    });
});

// MENSALIDADES EM ATRASO
router.get("/administrador/mensalidades/atraso", adminAut, (req, res) => {
    Mensalidade.findAll({
        order: [
            ['dataVencimento', 'ASC']
        ],
        include: [
            {
                model: Cliente, required: true,
                where: {  academiumId: admin.idAcademia }
            }
        ]
    }).then(mensalidades => {
        console.log(mensalidades)
        res.render("administrador/mensalidades/atraso", { mensalidades })
    });
});

// MENSALIDADES PAGAS
router.get("/administrador/mensalidades/pago", adminAut, (req, res) => {
    Mensalidade.findAll({
        order: [
            ['dataVencimento', 'ASC']
        ],
        include: [
            {
                model: Cliente, required: true,
                where: { academiumId: admin.idAcademia }
            }
        ]
    }).then(mensalidades => {
        res.render("administrador/mensalidades/pago", { mensalidades })
    });
});

// DETALHAR A MENSALIDADE
router.get("/administrador/mensalidades/detalhes/:id", adminAut, (req, res) => {
    let id = req.params.id;

    if (isNaN(id)) {
        res.redirect("/administrador/mensalidades/aberto");
    }

    Mensalidade.findByPk(id, {
        order: [
            ['dataVencimento', 'ASC']
        ],
        include: [
            {
                model: Cliente
            }
        ]
    }).then(mensalidade => {
        if (mensalidade != undefined) {
            Pacote.findByPk(mensalidade.cliente.pacoteId, {}).then(pacote => {
                res.render("administrador/mensalidades/detalhes", { mensalidade, pacote });
            });
        } else {
            res.redirect("/administrador/mensalidades/aberto");
        }
    }).catch(erro => {
        res.redirect("/administrador/mensalidades/aberto");
    });
});

// VALIDAR A MENSALIDADE
router.post("/mensalidades/validar", adminAut, (req, res) => {
    let id = req.body.inputID;
    let formaPagamento = req.body.selectPagamento;

    Mensalidade.update({
        formaPagamento,
        status: 'Pago',
        dataPagamento: Date()
    }, {
        where: { id }
    }).then(() => {
        res.redirect("/administrador/mensalidades/detalhes/" + id);
    });

});

// REVERTER A MENSALIDADE PAGA
router.post("/mensalidades/reverter", adminAut, (req, res) => {
    let id = req.body.inputID;

    Mensalidade.update({
        formaPagamento: null,
        status: 'Em aberto',
        dataPagamento: null
    }, {
        where: { id }
    }).then(() => {
        res.redirect("/administrador/mensalidades/detalhes/" + id);
    });

});

// SALVAR A ANTECIPAÇÃO DA MENSALIDADE NO BANCO DE DADOS
router.post("/mensalidades/antecipar", adminAut, (req, res) => {
    let id = req.body.inputID;
    let idPacote = req.body.selectPacote;
    let dataVencimento = req.body.inputDataVencimento;
    let formaPagamento = req.body.selectPagamento;

    connection.query(`call anteciparMensalidade('${id}', '${idPacote}', '${formaPagamento}', '${dataVencimento}')`, {
        type: Sequelize.DataTypes.INSERT
    }).then(() => {
        res.redirect("/administrador/mensalidades/antecipar/" + id); 
    }).catch(err => {
        console.log('Ocorreu um erro ao tentar salvar a antecipação da mensalidade: ' + err);
    })

});

// SALVAR A NOVA DATA DE VENCIMENTO NO BANCO DE DADOS
router.post("/mensalidades/alterarVencimento", adminAut, (req, res) => {
    let id = req.body.inputID;
    let dataVencimento = req.body.inputDataVencimento;

    connection.query(`call alterarVencimento('${id}', '${dataVencimento}')`, {
        type: Sequelize.DataTypes.INSERT
    }).then(() => {
        res.redirect("/administrador/mensalidades/alterarVencimento/" + id); 
    }).catch(err => {
        console.log('Ocorreu um erro ao tentar alterar a data de vencimento: ' + err);
    })

});

// LISTAR TODOS OS CLIENTES INCLUINDO O PACOTE PARA ANTECIPAÇÃO
router.get("/administrador/mensalidades/listarClientesAntecipacao", adminAut, (req, res) => {
    Cliente.findAll({
        where: {
            academiumId: admin.idAcademia,
            ativo: 1
        },
        order: [
            ['nome', 'ASC']
        ],
        include: [
            {
                model: Pacote
            }
        ]
    }).then(clientes => {
        res.render("administrador/mensalidades/listarClientesAntecipacao", { clientes });
    });
});

// LISTAR TODOS OS CLIENTES INCLUINDO O PACOTE PARA ALTERAÇÃO DO VENCIMENTO
router.get("/administrador/mensalidades/listarClientesAlteracaoVencimento", adminAut, (req, res) => {
    Cliente.findAll({
        where: {
            academiumId: admin.idAcademia,
            ativo: 1
        },
        order: [
            ['nome', 'ASC']
        ],
        include: [
            {
                model: Pacote
            }
        ]
    }).then(clientes => {
        res.render("administrador/mensalidades/listarClientesAlteracaoVencimento", { clientes });
    });
});

// LISTAR AS MENSALIDADES DO CLIENTE E PREENCHER OS DADOS DE ANTECIPAÇÃO
router.get("/administrador/mensalidades/antecipar/:id", adminAut, (req, res) => {
    let id = req.params.id;

    if (isNaN(id)) {
        res.redirect("/administrador/mensalidades/listarClientesAntecipacao");
    }


    Cliente.findByPk(id, {
        include: [
            {
                model: Pacote
            },
            {
                model: Mensalidade
            }
        ]
    }).then(cliente => {
        if (cliente != undefined) {

            Pacote.findAll({
                where: {
                    academiumId: admin.idAcademia
                }
            }).then((pacotes) => {
                Mensalidade.findAll({
                    where: { clienteId: id },
                    order: [
                        ['dataVencimento', 'ASC']
                    ]
                }).then(mensalidades => {
                    res.render("administrador/mensalidades/antecipar", { cliente, pacotes, mensalidades });
                });
            });

        } else {
            res.redirect("/administrador/mensalidades/listarClientesAntecipacao");
        }
    }).catch(erro => {
        res.redirect("/administrador/mensalidades/listarClientesAntecipacao");
    });
});

// LISTAR AS MENSALIDADES DO CLIENTE E PREENCHER OS DADOS DE ALTERAÇÃO DE VENCIMENTO
router.get("/administrador/mensalidades/alterarVencimento/:id", adminAut, (req, res) => {
    let id = req.params.id;

    if (isNaN(id)) {
        res.redirect("/administrador/mensalidades/listarClientesAlteracaoVencimento");
    }


    Cliente.findByPk(id, {
        include: [
            {
                model: Pacote
            },
            {
                model: Mensalidade
            }
        ]
    }).then(cliente => {
        if (cliente != undefined) {

            Pacote.findAll({
                where: {
                    academiumId: admin.idAcademia
                }
            }).then((pacotes) => {
                Mensalidade.findAll({
                    where: { clienteId: id },
                    order: [
                        ['dataVencimento', 'ASC']
                    ]
                }).then(mensalidades => {
                    res.render("administrador/mensalidades/alterarVencimento", { cliente, pacotes, mensalidades });
                });
            });

        } else {
            res.redirect("/administrador/mensalidades/listarClientesAlterarVencimento");
        }
    }).catch(erro => {
        res.redirect("/administrador/mensalidades/listarClientesAlterarVencimento");
    });
});


module.exports = router;