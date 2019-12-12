const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");
const Pacote = require("../models/Pacote");
const adminAut = require("../middlewares/adminAut");

// MENSALIDADES EM ABERTO
router.get("/administrador/mensalidades/aberto", adminAut, (req, res) => {
    Mensalidade.findAll({
        order: [
            ['dataVencimento', 'ASC']
        ],
        include: [
            {
                model: Cliente
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
                model: Cliente
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
                model: Cliente
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

module.exports = router;