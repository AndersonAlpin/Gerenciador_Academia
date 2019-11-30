const express = require("express");
const router = express.Router();
const Pacote = require("../models/Pacote");
const Cliente = require("../models/Cliente");

// LISTAR PACOTES
router.get("/administrador/pacotes/listar", (req, res) => {
    Pacote.findAll({ force: true }).then(pacotes => {
        res.render("administrador/pacotes/listar", { pacotes: pacotes });
    });
});

router.get("/administrador/pacotes/cadastro", (req, res) => {
    res.render("administrador/pacotes/cadastro")
});

// DELETAR UM PACOTE
router.post("/pacotes/delete", (req, res) => {
    var id = req.body.id;
    if (id != undefined) { //SE FOR DIFERENTE DE NULO
        if (!isNaN(id)) { //SE FOR UM NÚMERO  

            // ATUALIZAR OS CLIENTES QUE POSSUEM O PACOTE A SER DELETADO
            Cliente.update({ pacoteId: 1 }, {
                where: {
                    pacoteId: id
                }
            }).then(() => {

                // DELETE O PACOTE
                Pacote.destroy({
                    where: {
                        id: id
                    }
                }).then(() => {
                    res.redirect("/administrador/pacotes/listar");
                });

            });

        } else {
            res.redirect("/administrador/pacotes/listar");
        }
    } else {
        res.redirect("/administrador/pacotes/listar");
    }
});

// SALVAR O PACOTE APÓS PREENCHER O FORMULÁRIO
router.post("/pacote/salvar", (req, res) => {

    Pacote.create({
        nome: req.body.inputNome,
        descricao: req.body.inputDescricao,
        taxaDesconto: req.body.inputDesconto
    }).then(function () {
        res.redirect("/administrador/pacotes/listar")
    }).catch(function (erro) {
        res.redirect("/administrador/pacotes/listar")
    })
})

// EDITAR OS DADOS DE UM PACOTE
router.get("/administrador/pacotes/editar/:id", (req, res) => {
    var id = req.params.id;

    if (isNaN(id)) {
        res.redirect("/administrador/pacotes/listar")
    }

    Pacote.findByPk(id).then(pacote => {
        if (pacote != undefined) {
            res.render("administrador/pacotes/editar", { pacote: pacote });
        } else {
            res.redirect("/administrador/pacotes/listar")
        }
    }).catch(erro => {
        res.redirect("/administrador/pacotes/listar")
    })
});

module.exports = router;