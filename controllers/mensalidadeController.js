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
                where: {
                    AcademiumId: admin.idAcademia
                }
            }
        ]
    }).then(mensalidades => {
        console.log(mensalidades)
        res.render("administrador/mensalidades/aberto", { mensalidades: mensalidades })
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
                where: {
                    AcademiumId: admin.idAcademia
                }
            }
        ]
    }).then(mensalidades => {
        console.log(mensalidades)
        res.render("administrador/mensalidades/atraso", { mensalidades: mensalidades })
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
                where: {
                    AcademiumId: admin.idAcademia
                }
            }
        ]
    }).then(mensalidades => {
        res.render("administrador/mensalidades/pago", { mensalidades: mensalidades })
    });
});

// DETALHAR A MENSALIDADE
router.get("/administrador/mensalidades/detalhes/:id", adminAut, (req, res) => {
    var id = req.params.id;

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
                res.render("administrador/mensalidades/detalhes", { mensalidade: mensalidade, pacote: pacote });
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
    var id = req.body.inputID;
    var forma = req.body.inputPagamento;

    Mensalidade.update({
        formaPagamento: forma,
        status: 'Pago',
        dataPagamento: Date()
    }, {
        where: {
            id: id
        }
    }).then(() => {
        res.redirect("/administrador/mensalidades/detalhes/" + id);
    });

});

// REVERTER A MENSALIDADE PAGA
router.post("/mensalidades/reverter", adminAut, (req, res) => {
    var id = req.body.inputID;

    Mensalidade.update({
        formaPagamento: null,
        status: 'Em aberto',
        dataPagamento: null
    }, {
        where: {
            id: id
        }
    }).then(() => {
        res.redirect("/administrador/mensalidades/detalhes/" + id);
    });

});

// SALVAR A ANTECIPAÇÃO DA MENSALIDADE NO BANCO DE DADOS
router.post("/mensalidades/antecipar", adminAut, (req, res) => {
    let id = req.body.inputID;
    let idPacote = req.body.inputPacote;
    let dataVencimento = req.body.inputDataVencimento;
    let formaPagamento = req.body.inputPagamento;

    connection.query(`call anteciparMensalidade('${id}', '${idPacote}', '${formaPagamento}', '${dataVencimento}')`, {
        type: Sequelize.DataTypes.INSERT
    }).then(() => {
        res.redirect("/administrador/mensalidades/antecipar/" + id); 
    }).catch(err => {
        console.log('Ocorreu um erro ao tentar salvar a antecipação da mensalidade: ' + err);
    })

});

// LISTAR TODOS OS CLIENTES INCLUINDO O PACOTE
router.get("/administrador/mensalidades/listar/clientes", adminAut, (req, res) => {
    Cliente.findAll({
        where: {
            AcademiumId: admin.idAcademia,
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
        res.render("administrador/mensalidades/listar", { clientes: clientes });
    });
});

// LISTAR AS MENSALIDADES DO CLIENTE E PREENCHER OS DADOS DE ANTECIPAÇÃO
router.get("/administrador/mensalidades/antecipar/:id", adminAut, (req, res) => {
    var id = req.params.id;

    if (isNaN(id)) {
        res.redirect("/administrador/mensalidades/listar");
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
                    AcademiumId: admin.idAcademia
                }
            }).then((pacotes) => {
                Mensalidade.findAll({
                    where: {
                        clienteId: id
                    },
                    order: [
                        ['dataVencimento', 'DESC']
                    ]
                }).then(mensalidades => {
                    res.render("administrador/mensalidades/antecipar", { cliente: cliente, pacotes: pacotes, mensalidades: mensalidades });
                });
            });

        } else {
            res.redirect("/administrador/mensalidades/listar");
        }
    }).catch(erro => {
        res.redirect("/administrador/mensalidades/listar");
    });
});


module.exports = router;