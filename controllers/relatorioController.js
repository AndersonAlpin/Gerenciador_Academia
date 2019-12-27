const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
const Cliente = require("../models/Cliente");
const Mensalidade = require("../models/Mensalidade");
const Sequelize = require("sequelize");
const connection = require("../database/connection");

// RELATÓRIO GERAL
router.get("/administrador/relatorios/listar", adminAut, (req, res) => {

    global.selecionado = 00;

    let relatorio = {
        numClientes: 0,
        numClientesAtivos: 0,
        numClientesInativos: 0,
        numMensalidadePago: 0,
        numMensalidadeAtraso: 0,
        numMensalidadeReceber: 0,
        totalEntradas: 0,
        totalReceber: 0,
        totalAtraso: 0,
        numHomens: 0,
        numMulheres: 0,
        numCartao: 0,
        numDinheiro: 0,
        numDeposito: 0,
        numTransferencia: 0,
        valorCartao: 0,
        valorDinheiro: 0,
        valorDeposito: 0,
        valorTransferencia: 0
    }

    let gerarRelatorios = async () => {

        let mensalidades = await Mensalidade.findAll({
            include: [
                {
                    model: Cliente, required: true,
                    where: { academiumId: admin.idAcademia }
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


            // FORMAS DE PAGAMENTO
            let forma = mensalidade.formaPagamento;

            switch (forma) {
                case 'Dinheiro':
                    relatorio.numDinheiro++;
                    relatorio.valorDinheiro += mensalidade.valor;
                    break;
                case 'Cartão':
                    relatorio.numCartao++;
                    relatorio.valorCartao += mensalidade.valor;
                    break;
                case 'Depósito':
                    relatorio.numDeposito++;
                    relatorio.valorDeposito += mensalidade.valor;
                    break;
                case 'Transferencia':
                    relatorio.numTransferencia++;
                    relatorio.valorTransferencia += mensalidade.valor;
                    break;
            }
        });

        let clientes = await Cliente.findAll({
            where: { academiumId: admin.idAcademia }
        });

        // NUMERO CLIENTES
        clientes.forEach(cliente => {
            relatorio.numClientes++;

            // ATIVOS/INATIVOS
            if (cliente.ativo == '1') {
                relatorio.numClientesAtivos++
            } else {
                relatorio.numClientesInativos++;
            }

            // HOMENS/MULHERES
            if (cliente.sexo == 'Masculino') {
                relatorio.numHomens++;
            } else {
                relatorio.numMulheres++;
            }
        });

        res.render("administrador/relatorios/listar", { relatorio });
        
    }

    gerarRelatorios();
});

// RELATÓRIO MENSAL
router.get("/administrador/relatorios/listar/:mes", adminAut, (req, res) => {

    let mes = req.params.mes;

    global.selecionado = mes;

    let relatorio = {
        numClientes: 0,
        numClientesAtivos: 0,
        numClientesInativos: 0,
        numMensalidadePago: 0,
        numMensalidadeAtraso: 0,
        numMensalidadeReceber: 0,
        totalEntradas: 0,
        totalReceber: 0,
        totalAtraso: 0,
        numHomens: 0,
        numMulheres: 0,
        numCartao: 0,
        numDinheiro: 0,
        numDeposito: 0,
        numTransferencia: 0,
        valorCartao: 0,
        valorDinheiro: 0,
        valorDeposito: 0,
        valorTransferencia: 0
    }

    let gerarRelatorios = async () => {

        let mensalidades = await connection.query(`
            call relatorioMensalidades('${admin.idAcademia}', '${mes}')`, {
            type: Sequelize.DataTypes.SELECT
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


            // FORMAS DE PAGAMENTO
            let forma = mensalidade.formaPagamento;

            switch (forma) {
                case 'Dinheiro':
                    relatorio.numDinheiro++;
                    relatorio.valorDinheiro += mensalidade.valor;
                    break;
                case 'Cartão':
                    relatorio.numCartao++;
                    relatorio.valorCartao += mensalidade.valor;
                    break;
                case 'Depósito':
                    relatorio.numDeposito++;
                    relatorio.valorDeposito += mensalidade.valor;
                    break;
                case 'Transferencia':
                    relatorio.numTransferencia++;
                    relatorio.valorTransferencia += mensalidade.valor;
                    break;
            }
        });

        let clientes = await connection.query(`
        call relatorioClientes('${admin.idAcademia}', '${mes}')`, {
            type: Sequelize.DataTypes.SELECT
        });

        // NUMERO CLIENTES
        clientes.forEach(cliente => {
            relatorio.numClientes++;

            // ATIVOS/INATIVOS
            if (cliente.ativo == '1') {
                relatorio.numClientesAtivos++
            } else {
                relatorio.numClientesInativos++;
            }

            // HOMENS/MULHERES
            if (cliente.sexo == 'Masculino') {
                relatorio.numHomens++;
            } else {
                relatorio.numMulheres++;
            }
        });

        res.render("administrador/relatorios/listar", { relatorio });
    }

    gerarRelatorios();
});

module.exports = router;