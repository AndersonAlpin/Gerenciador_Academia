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
