const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const port = 8080;

// IMPORTAR ROTAS
const administradorController = require("./controllers/administradorController");
const clienteController = require("./controllers/clienteController");
const mensalidadeController = require("./controllers/mensalidadeController");
const pacoteController = require("./controllers/pacoteController");
const relatorioController = require("./controllers/relatorioController");

// VIEW ENGINE
app.set('view engine', 'ejs');

// STATIC
app.use(express.static('public'));

//BODY PARSERE
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// ROTAS IMPORTADAS
app.use("/", administradorController);
app.use("/", clienteController);
app.use("/", mensalidadeController);
app.use("/", pacoteController);
app.use("/", relatorioController);

// ROTA PRINCIPAL
app.get("/", (req, res) => {
    res.render("index");
});

// APP SERVIDOR
app.listen(port, () => { console.log("App rodando!") });