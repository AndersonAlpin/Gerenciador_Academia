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

// Filtros
window.onload = function () {
    // FILTAR POR NOME
    var filtroNome = document.getElementById('buscarNome');

    if (filtroNome) {
        var tabela = document.getElementById('tabela');
        filtroNome.onkeyup = function () {
            var nomeFiltro = filtroNome.value;
            for (var i = 1; i < tabela.rows.length; i++) {
                var conteudoCelula = tabela.rows[i].cells[0].innerText;
                var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro) >= 0;
                tabela.rows[i].style.display = corresponde ? '' : 'none';
            }
        };
    }

    // FILTAR POR EMAIL
    var filtroEmail = document.getElementById('buscarEmail');

    if (filtroEmail) {
        var tabela = document.getElementById('tabela');
        filtroEmail.onkeyup = function () {
            var emailFiltro = filtroEmail.value;
            for (var i = 1; i < tabela.rows.length; i++) {
                var conteudoCelula = tabela.rows[i].cells[3].innerText;
                var corresponde = conteudoCelula.toLowerCase().indexOf(emailFiltro) >= 0;
                tabela.rows[i].style.display = corresponde ? '' : 'none';
            }
        };
    }

    // FILTAR POR CPF
    var filtroCPF = document.getElementById('buscarCPF');

    if (filtroCPF) {
        var tabela = document.getElementById('tabela');
        filtroCPF.onkeyup = function () {
            var cpfFiltro = filtroCPF.value;
            for (var i = 1; i < tabela.rows.length; i++) {
                var conteudoCelula = tabela.rows[i].cells[2].innerText;
                var corresponde = conteudoCelula.toLowerCase().indexOf(cpfFiltro) >= 0;
                tabela.rows[i].style.display = corresponde ? '' : 'none';
            }
        };
    }
    
    // FILTAR POR CPF
    var filtroDesconto = document.getElementById('buscarDesconto');

    if (filtroDesconto) {
        var tabela = document.getElementById('tabela');
        filtroDesconto.onkeyup = function () {
            var descontoFiltro = filtroDesconto.value;
            for (var i = 1; i < tabela.rows.length; i++) {
                var conteudoCelula = tabela.rows[i].cells[2].innerText;
                var corresponde = conteudoCelula.toLowerCase().indexOf(descontoFiltro) >= 0;
                tabela.rows[i].style.display = corresponde ? '' : 'none';
            }
        };
    }
}