const express = require("express");
const router = express.Router();
const Pacote = require("../models/Pacote");
const Cliente = require("../models/Cliente");
const adminAut = require("../middlewares/adminAut");

// LISTAR PACOTES
router.get("/administrador/pacotes/listar", adminAut, (req, res) => {
    Pacote.findAll({
        order: [
            ['taxaDesconto', 'DESC']
        ]
    }).then(pacotes => {
        res.render("administrador/pacotes/listar", { pacotes: pacotes });
    });
});

router.get("/administrador/pacotes/cadastro", (req, res) => {
    res.render("administrador/pacotes/cadastro")
});

// DELETAR UM PACOTE
router.post("/pacotes/delete", adminAut, (req, res) => {
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
router.post("/pacote/salvar", adminAut, (req, res) => {
    var nome = req.body.inputNome;
    var descricao = req.body.inputDescricao;
    var desconto = req.body.inputDesconto;

    validar = 1;

    if (nome == "" || descricao == "" || desconto == "") {
        validar = 0;
    }

    if (validar == 1) {
        Pacote.create({
            nome: nome,
            descricao: descricao,
            taxaDesconto: desconto
        }).then(function () {
            res.redirect("/administrador/pacotes/listar");
        }).catch(function (erro) {
            res.redirect("/administrador/pacotes/listar");
        });
    } else {
        req.flash('error', 'Preencha todos os campos!');
        res.redirect("/administrador/pacotes/cadastro/");
    }

});

// EDITAR OS DADOS DE UM PACOTE
router.get("/administrador/pacotes/editar/:id", adminAut, (req, res) => {
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

// SALVAR PACOTE APÓS EDIÇÃO
router.post("/pacote/update", adminAut, (req, res) => {
    var nome = req.body.inputNome;
    var descricao = req.body.inputDescricao;
    var desconto = req.body.inputDesconto
    var id = req.body.inputID;

    Pacote.update({
        nome: nome,
        descricao: descricao,
        taxaDesconto: desconto
    }, {
        where: {
            id: id
        }
    }).then(function () {
        res.redirect("/administrador/pacotes/listar");
    });

});

module.exports = router;