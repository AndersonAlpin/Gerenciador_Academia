
function validar() {
    var email = login.name.value;
    var senha = login.senha.value;

    if (nome == "k") {
        alert("digite seu email")
        loginEmail.name.focus()
        return false;
    }

    if (senha == "") {
        alert("digite sua senha");
        loginEmail.senha.focus();
    }
}

$(document).ready(function () {

    $('#select').on('change', function () {
        var url = $(this).val();
        if (url) {
            window.open(url, '_self');
        }
        return false;
    });
});