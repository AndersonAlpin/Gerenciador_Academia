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


var $destinatario = 'aldinho-reges@hotmail.com';




// ENVIAR EMAIL DE BOAS VINDAS
router.get("/email/send/bemvindo", adminAut, (req, res) => {
    var emailBemVindo = ` 
        
    `;

    var mailOptions = {
        from: $usuario,
        to: $destinatario,
        subject: 'Bem-vindo(a)!! ',
        text: 'Bem-vindo',
        html: '<h1>Bem vindo<h1>',
        attachments: [
            {
                filename: '**',
                path: __dirname + '/bemvindo.jpg'
            }
        ]
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