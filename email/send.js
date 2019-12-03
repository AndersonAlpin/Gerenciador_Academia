const express = require("express");
const router = express.Router();
const adminAut = require("../middlewares/adminAut");
var nodemailer = require('nodemailer');

var $usuario = 'academiaprojetoweb@gmail.com';
var $senha = 'Web123321';

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: $usuario,
        pass: $senha
    }
});


var $destinatario = 'andersonalpim@gmail.com';


var emailBemVindo = ` 
    
`;


// ENVIAR EMAIL DE BOAS VINDAS
router.get("/email/send/bemvindo", adminAut, (req, res) => {
    var mailOptions = {
        from: $usuario,
        to: $destinatario,
        subject: 'Welcome!! ',
        text: 'Tudo certo',
        html: emailBemVindo
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email enviado: ' + info.response);
            res.redirect("/administrador/clientes/listar")
        }
    });
});

module.exports = router;