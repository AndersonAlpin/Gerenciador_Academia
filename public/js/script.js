// =============================
// ===========CLIENTE===========
//CADASTRO CLIENTE
// PEGAR VALOR DO SELECT E COLOCAR NO INPUT
var pacote = document.getElementById("selectPacote");

if (pacote) {
    document.getElementById("selectPacote").addEventListener("change", selecionarPacote);
}

function selecionarPacote() {
    var select = document.getElementById("selectPacote");
    var selecionado = select.options[select.selectedIndex].value;
    document.getElementById("inputPacote").value = selecionado;
}
///////////////////////////////////////////////////////////////////////////////////////////

// PEGAR VALOR DO SELECT E COLOCAR NO INPUT
var UF = document.getElementById("selectUF");

if (UF) {
    document.getElementById("selectUF").addEventListener("change", selecionarUF);
}

function selecionarUF() {
    var selectUF = document.getElementById("selectUF");
    var selecionadoUF = selectUF.options[selectUF.selectedIndex].text;
    document.getElementById("inputUF").value = selecionadoUF;
}
///////////////////////////////////////////////////////////////////////////////////////

// PEGAR VALOR DO SELECT E COLOCAR NO INPUT
var pagamento = document.getElementById("selectPagamento");

if (pagamento) {
    document.getElementById("selectPagamento").addEventListener("change", selectPagamento);
}


function selectPagamento() {
    var selectPagamento = document.getElementById("selectPagamento");
    var selecionandoPagamento = selectPagamento.options[selectPagamento.selectedIndex].text;
    document.getElementById("inputPagamento").value = selecionandoPagamento;
}
////////////////////////////////////////////////////////////////////////////////////////////

// PEGAR VALOR DO SELECT E COLOCAR NO INPUT
var sexo = document.getElementById("selectSexo");

if (sexo) {
    document.getElementById("selectSexo").addEventListener("change", selectSexo);
}


function selectSexo() {
    var selectSexo = document.getElementById("selectSexo");
    var selecionandoSexo = selectSexo.options[selectSexo.selectedIndex].text;
    document.getElementById("inputSexo").value = selecionandoSexo;
}
////////////////////////////////////////////////////////////////////////////////////////////

// BUSCA NAS TABELAS
window.onload = function () {
    var filtro = document.getElementById('buscar');

    if (filtro) {
        var tabela = document.getElementById('tabela');
        filtro.onkeyup = function () {
            var nomeFiltro = filtro.value;
            for (var i = 1; i < tabela.rows.length; i++) {
                var conteudoCelula = tabela.rows[i].cells[0].innerText;
                var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro) >= 0;
                tabela.rows[i].style.display = corresponde ? '' : 'none';
            }
        };
    }
}