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

            
            // FORMAS DE PAGAMENTO
            let forma = mensalidade.formaPagamento;
            console.log(forma)

            switch(forma){
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
            where: { AcademiumId: admin.idAcademia }
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
            if(cliente.sexo == 'Masculino'){
                relatorio.numHomens++;
            }else{
                relatorio.numMulheres++;
            }
        });

        res.render("administrador/relatorios/listar", { relatorio });
    }

    gerarRelatorios();
});

module.exports = router;