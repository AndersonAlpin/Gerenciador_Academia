const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const port = 8080;

//EXPRESS utilizará o EJS
app.set('view engine', 'ejs');

//Utilizará arquivos estáticos
app.use(express.static('public'));

//Decofidicar os dados enviados pelo formulário
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Rotas
app.get("/", (req, res) => {
    res.render("index");
});

app.post("/home", (req, res) => {
    var email = req.body.email;
    var senha = req.body.senha;
    res.render("home", {
        email: email,
        senha: senha
    });
});

app.get("/clientes", (req, res) => {
    res.render("clientes");
});
app.get("/cadastro-cliente", (req, res) => {
    res.render("cadastro-cliente");
});

app.get("/mensalidades", (req, res) => {
    res.render("mensalidades");
});

app.get("/pacotes", (req, res) => {
    res.render("pacotes");
});

app.get("/relatorios", (req, res) => {
    res.render("relatorios");
});

app.listen(port, () => { console.log("App rodando!") });