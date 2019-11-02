const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const port = 4040;

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

app.listen(port, () => { console.log("App rodando!") });