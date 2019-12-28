const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
const Gasto = require("../models/Gasto");
const Academia = require("../models/Academia");
const EnderecoAcademia = require("../models/EnderecoAcademia");
const Sequelize = require("sequelize");
const connection = require("../database/connection");

// ROTA DE FERRAMENTAS
router.get("/administrador/ferramentas", adminAut, (req, res) => {

    let dadosAcademia = async () => {
        let academia = await Academia.findOne({
            where: { id: admin.idAcademia },
            include: [
                {
                    model: EnderecoAcademia
                }
            ]
        });

        let mensalidade = await connection.query('SELECT * FROM viewMensalidade', {
            raw: true,
            type: Sequelize.QueryTypes.SELECT
        });

        res.render("administrador/ferramentas/index", {academia, mensalidade});
    }

    dadosAcademia();
});

// ROTA DE ATUALIZAR DADOS
router.post("/atualizarAcademia", (req, res) => {
    var nome =  req.body.inputNome;
    var valor =  req.body.inputValor.replace(',', '.');
    var logradouro =  req.body.inputLogradouro;
    var numero =  req.body.inputNumero;
    var cidade =  req.body.inputCidade;
    var bairro =  req.body.inputBairro;
    var cep =  req.body.inputCEP;
    var uf =  req.body.selectUF;

    let atualizarDados = async () => {

        await Academia.update({
           nome 
        }, {
            where: {id: admin.idAcademia}
        });

        await EnderecoAcademia.update({
            logradouro,
            numero,
            cidade,
            bairro,
            cep,
            uf
        }, {
            where: {academiumId: admin.idAcademia}
        });

        await connection.query(`ALTER TABLE mensalidades ALTER valor SET DEFAULT ${valor}`, {
            type: Sequelize.DataTypes.INSERT
        });

        res.redirect("/administrador/ferramentas");
    }

    atualizarDados();
});


// CADASTRAR OS GASTOS DA ACADEMIA
router.post("/inserirGastos", (req, res) => {
    var valor =  req.body.inputValor.replace(',', '.');
    var descricao =  req.body.inputDescricao;

    let atualizarDados = async () => {

        await Gasto.create({
           valor,
           descricao,
           academiumId: admin.idAcademia
        });

        res.redirect("/administrador/ferramentas");
    }

    atualizarDados();
});

module.exports = router;