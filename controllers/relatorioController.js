const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");

router.get("/administrador/relatorios/listar", adminAut, (req, res) => {

    let relatorio = {
        numClientes: 0,
        numClientesAtivos: 0,
        numClientesInativos: 0,
        numMensalidadePago: 0, 
        numMensalidadeAtraso: 0,
        numMensalidadeReceber: 0,
        totalEntradas: 0,
        totalReceber: 0,
        totalAtraso: 0
    }

    let gerarRelatorios = async () => {
        
        let mensalidades = await Mensalidade.findAll({
            include: [
                {
                    model: Cliente, required: true,
                    where: { AcademiumId: admin.idAcademia }
                }
            ]
        });

        mensalidades.forEach(mensalidade => {

            // NÚMERO MENSALIDADES 
            if (mensalidade.status == 'Pago') {
                relatorio.numMensalidadePago++;
                relatorio.totalEntradas += mensalidade.valor;
            } else {
                if (mensalidade.status == 'Em aberto') {
                    relatorio.numMensalidadeReceber++;
                    relatorio.totalReceber += mensalidade.valor;
                } else {
                    relatorio.numMensalidadeAtraso++;
                    relatorio.totalAtraso += mensalidade.valor;
                }
            }
        });

        let clientes = await Cliente.findAll({
            where: { AcademiumId: admin.idAcademia }
        });

        // NUMERO CLIENTES
        clientes.forEach(cliente => {
            relatorio.numClientes++;

            if (cliente.ativo == '1') {
                relatorio.numClientesAtivos++
            } else {
                relatorio.numClientesInativos++;
            }
        });

        res.render("administrador/relatorios/listar", { relatorio });
    }

    gerarRelatorios();
});

module.exports = router;