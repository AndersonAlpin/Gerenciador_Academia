const express = require("express");
const router = express.Router();
const Cliente = require("../models/Cliente")
const Mensalidade = require("../models/Mensalidade")

// MENSALIDADES EM ABERTO
router.get("/administrador/mensalidades/aberto", (req, res) => {
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
router.get("/administrador/mensalidades/atraso", (req, res) => {
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

router.get("/administrador/mensalidades/detalhes/:id", (req, res) => {
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
            res.render("administrador/mensalidades/detalhes", { mensalidade: mensalidade })
        } else {
            res.redirect("/administrador/mensalidades/aberto");
        }
    }).catch(erro => {
        res.redirect("/administrador/mensalidades/aberto");
    });
});

router.post("/mensalidades/validar", (req, res) => {

});

module.exports = router;