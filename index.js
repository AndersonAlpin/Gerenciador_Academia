const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const session = require("express-session");
const flash = require("express-flash");
const connection = require("./database/connection");
const email =  require("./email/send");
const port = 8080;

// IMPORTAR ROTAS
const pacoteController = require("./controllers/pacoteController");
const clienteController = require("./controllers/clienteController");
const relatorioController = require("./controllers/relatorioController");
const mensalidadeController = require("./controllers/mensalidadeController");
const adminController = require("./controllers/administradorController");
// /////////////////////////////////////////////////////////////////////////////////

// VIEW ENGINE
app.set('view engine', 'ejs');
//////////////////////////////

// SESSÕES
app.use(session({
    secret: "pode digitar qualquer coisa aqui", cookie: {maxAge: 300000},
    resave: false,
    saveUninitialized: true
}));
// //////////////////////////////////////////////////

// INICIALIZAR O FLASH
app.use(flash());
// ///////////////////

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
app.use("/", adminController);
//////////////////////////////////////


// IMPORTAR MODELS
const Academia = require("./models/Academia");
const Administrador = require("./models/Administrador");
const Login = require("./models/Login");
const Pacote = require("./models/Pacote");
const Cliente = require("./models/Cliente");
const EnderecoClientecoCliente = require("./models/EnderecoCliente");
const Mensalidade = require("./models/Mensalidade");
/////////////////////////////////////////////////////////////////////

// Database
connection
    .authenticate()
    .then(() => {
        console.log("Conexão feita com sucesso!");
    }).catch((error) => {
        console.log(error)
    })
//////////////////////////////////////////////////


// ROTA PRINCIPAL
app.get("/login", (req, res) => {
    res.render("login");
});
////////////////////////////

// APP SERVIDOR
app.listen(port, () => { console.log("App rodando!") });