const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");

router.get("/administrador/relatorios/listar", adminAut, (req, res) => {

    var relatorio = new Object();

    relatorio.numClientes = 0;
    relatorio.numClientesAtivos = 0;
    relatorio.numClientesInativos = 0;

    relatorio.numMensalidadePago = 0;
    relatorio.numMensalidadeAtraso = 0;
    relatorio.numMensalidadeReceber = 0;

    relatorio.totalEntradas = 0;
    relatorio.totalReceber = 0;
    relatorio.totalAtraso = 0;

    // NÚMERO MENSALIDADES 
    Mensalidade.findAll({
        include: [
            {
                model: Cliente, required: true,
                where: {
                    AcademiumId: admin.idAcademia
                }
            }
        ]
    }).then(mensalidades => {
        mensalidades.forEach(mensalidade => {
            if (mensalidade.status == 'Pago') {
                relatorio.numMensalidadePago++;
            } else {
                if (mensalidade.status == 'Em aberto') {
                    relatorio.numMensalidadeReceber++;
                } else {
                    relatorio.numMensalidadeAtraso++;
                }
            }
        });
    });

    // VALOR MENSALIDADES
    Mensalidade.findAll({
        include: [
            {
                model: Cliente, required: true,
                where: {
                    AcademiumId: admin.idAcademia
                }
            }
        ]
    }).then(mensalidades => {
        mensalidades.forEach(mensalidade => {
            if (mensalidade.status == 'Pago') {
                relatorio.totalEntradas += mensalidade.valor;
            } else {
                if (mensalidade.status == 'Em aberto') {
                    relatorio.totalReceber += mensalidade.valor;
                } else {
                    relatorio.totalAtraso += mensalidade.valor;
                }
            }
        });
    });

    // NUMERO CLIENTES
    Cliente.findAll({
        where: {
            AcademiumId: admin.idAcademia
        }
    }).then(clientes => {
        clientes.forEach(cliente => {
            relatorio.numClientes++;

            if (cliente.ativo == '1') {
                relatorio.numClientesAtivos++
            } else {
                relatorio.numClientesInativos++;
            }
        });
        res.render("administrador/relatorios/listar", {
            relatorio: relatorio
        });
    });
});

module.exports = router;