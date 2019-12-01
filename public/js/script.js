// =============================
// ===========CLIENTE===========
//CADASTRO CLIENTE
var pacote = document.getElementById("selectPacote");

if(pacote){
    document.getElementById("selectPacote").addEventListener("change", selecionarPacote);
}

function selecionarPacote() {
    var select = document.getElementById("selectPacote");
    var selecionado = select.options[select.selectedIndex].value;
    document.getElementById("inputPacote").value = selecionado;
}

var UF = document.getElementById("selectUF");

if(UF){
    document.getElementById("selectUF").addEventListener("change", selecionarUF);
}

function selecionarUF() {
    var selectUF = document.getElementById("selectUF");
    var selecionadoUF = selectUF.options[selectUF.selectedIndex].text;
    document.getElementById("inputUF").value = selecionadoUF;
}

var pagamento = document.getElementById("selectPagamento");

if(pagamento){
    document.getElementById("selectPagamento").addEventListener("change", selectPagamento);
}

function selectPagamento() {
    var selectPagamento = document.getElementById("selectPagamento");
    var selecionandoPagamento = selectPagamento.options[selectPagamento.selectedIndex].text;
    document.getElementById("inputPagamento").value = selecionandoPagamento;
}

