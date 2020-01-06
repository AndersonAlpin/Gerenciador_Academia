const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
const Cliente = require("../models/Cliente");
const Pacote = require("../models/Pacote");
const ExameBiometrico = require("../models/ExameBiometrico");
const Sequelize = require("sequelize");
const connection = require("../database/connection");

// LISTAR TODOS OS CLIENTES INCLUINDO O PACOTE
router.get("/administrador/exame/clientes", adminAut, (req, res) => {
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
        res.render("administrador/exame/clientes", { clientes });
    });
});

// LISTAR O IMC DO CLIENTE
router.get("/administrador/exame/listar/:id", adminAut, (req, res) => {
    let clienteId = req.params.id;

    ExameBiometrico.findAll({
        where: { clienteId },
        order: [['id', 'DESC']],
        include: [{model: Cliente}]
    }).then(exameBiometrico => {
        console.log(exameBiometrico)
        res.render("administrador/exame/listar", {exameBiometrico, clienteId});
    });
});

// SALVAR OS DADOS PARA CALCULAR O IMC
router.post("/insert/imc", adminAut, (req, res) => {
    let clienteId = req.body.inputID;
    let peso = req.body.inputPeso;
    let altura = req.body.inputAltura;

    
    connection.query(`
    call calculoIMC('${clienteId}', '${altura}', '${peso}')`, {
        type: Sequelize.DataTypes.INSERT
    }).then(() => {
        res.redirect("/administrador/exame/listar/" + clienteId);
    });
    
});

module.exports = router;