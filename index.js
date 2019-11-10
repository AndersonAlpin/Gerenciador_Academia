const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const port = 8080;

// IMPORTAR ROTAS
const pacoteController = require("./controllers/pacoteController");
const clienteController = require("./controllers/clienteController");
const relatorioController = require("./controllers/relatorioController");
const mensalidadeController = require("./controllers/mensalidadeController");
const administradorController = require("./controllers/administradorController");
const validarLogin = require("./controllers/validarLogin");
/////////////////////////////////////////////////////////////////////////////////

// VIEW ENGINE
app.set('view engine', 'ejs');
//////////////////////////////

// STATIC
app.use(express.static('public'));
//////////////////////////////////

//BODY PARSERE
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
////////////////////////////////////////////////////

// ROTAS IMPORTADAS
app.use("/", pacoteController);
app.use("/", clienteController);
app.use("/", relatorioController);
app.use("/", mensalidadeController);
app.use("/", administradorController);
app.use("/", validarLogin);
//////////////////////////////////////

// IMPORTAR MODELS
const Academia = require("./models/Academia");
const Login = require("./models/Login");
const Administrador = require("./models/Administrador");
const Pacote = require("./models/Pacote");
const Cliente = require("./models/Cliente");
const Mensalidade = require("./models/Mensalidade");
const EnderecoClientecoCliente = require("./models/EnderecoCliente");
////////////////////////////////////////////////////////////

// ROTA PRINCIPAL
app.get("/", (req, res) => {
    res.render("index");
});
////////////////////////////

// APP SERVIDOR
app.listen(port, () => { console.log("App rodando!") });